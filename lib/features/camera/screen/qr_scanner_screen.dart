import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/transfer_qr_screen.dart';

import '../../users_wallet/controller/users_wallet_controller.dart';
import '../../wallet/screens/transfer_screen.dart';

class QrScannerScreen extends StatefulWidget {


  const QrScannerScreen({super.key});

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final UsersWalletController usersWalletController = Get.find();
  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 300),
                    child: const Text(
                      'Di chuyển camera để quét',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(
                        Icons.upload_file,
                        color: Colors.white,
                      ),
                      label: const Text('Tải ảnh lên',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null && result!.code != null) {

          String data = result!.code.toString();

          // Tách chuỗi thành danh sách các chuỗi bằng cách sử dụng dấu phẩy
          // value,message,email
          List<String> arr = data.trim().split(",");
          if(arr.length ==1){
            String email = arr[0];
            usersWalletController.updateEmail(email);
            Get.to(TransferScreen(isQrEmail: true));
          }

          if(arr.length ==3){
            String email = arr[2];
            String value = arr[0];
            String message = arr[1];
            usersWalletController.updateEmail(email);
            usersWalletController.updateValue(int.parse(value));
            usersWalletController.updateMessage(message);
            Get.to(TransferScreen(isQrAll: true));
          }
          //thêm chức năng Hiện thị lỗi QR ko hợp lệ
        } else {

        }
      });
    });
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      // Handle the selected image file
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TransferQrScreen(),
        ),
      );
    } else {
      // User canceled the picker
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


