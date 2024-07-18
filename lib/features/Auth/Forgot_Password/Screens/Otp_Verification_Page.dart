import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/helper/validator.dart';
import 'package:tomiru_social_flutter/features/Auth/forgot_password/Screens/Create_Password_Page.dart';
import 'package:tomiru_social_flutter/features/Auth/forgot_password/Widgets/otpWidget.dart';
import 'package:tomiru_social_flutter/widgets/custom_appbar.dart';
import 'package:tomiru_social_flutter/widgets/custom_button.dart';



class OTPVerificationPage extends StatefulWidget {
  final bool? isEmailVerification;
  final bool? isSmsVerification;
  final bool? isWhatsAppVerification;
  final String? infoUser;
  final String? userAction;
  final String? titlePage;
  OTPVerificationPage(
      {Key? key,
      bool? this.isEmailVerification,
      this.isSmsVerification,
      String? this.infoUser,
      this.userAction,
      required this.titlePage,
      this.isWhatsAppVerification})
      : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  bool isExpanded = false;
  List<String> currentOTPCode = [];
  Validator validator = Validator();
  @override
  void initState() {
    super.initState();
  }

  Widget _toggleButtonHelp() {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color(0xFFF5F5F5),
      ),
      onPressed: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Tôi cần hỗ trợ ?',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Icon(
            !isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _helpInfo() {
    return Visibility(
      visible: isExpanded,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Không nhận được mã xác thực ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("• Thời gian các mã xác thực gửi cách nhau 60 giây",
                  style: TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("• Bạn có tối đa 03 lần yêu cầu để xác thực",
                  style: TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                  "• Vui lòng kiểm tra hòm thư SPAM, đổi với xác thực qua Email",
                  style: TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                  "• Đảm bảo thuê bao điện thoại đang hoạt động, không khóa 2 chiều",
                  style: TextStyle(fontSize: 12)),
            ),
            SizedBox(height: 10),
            Text("Liên hệ hỗ trợ kỹ thuật :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("• Tổng đài hỗ trợ: 0934343434",
                  style: TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("• Hotline kỹ thuật: 0934343434",
                  style: TextStyle(fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("• Zalo chat hỗ trợ", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Center(
          child: Text(
            'Nhập mã xác thực',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: OTPWidget(
            info: widget.infoUser,
            isEmailVerification: widget.isEmailVerification,
            onCodeChanged: (List<String> code) {
              setState(() {
                currentOTPCode = code;
              });
              print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
              print("Mã OTP: $code");
              print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            },
          ),
        ),
        SizedBox(height: 15),
        Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: _toggleButtonHelp()),
        Padding(
            padding: EdgeInsets.only(right: 20, left: 20), child: _helpInfo()),
        SizedBox(height: !isExpanded ? 320 : 107),
      ],
    );
  }

  bool isValidCurrentOTPCode() {
    if (validator.validCurrentCodeOTP(currentOTPCode)) {
      print('OTP is valid');
      return true;
    } else {
      print('Invalid OTP');
      return false;
    }
  }

  void submitHandler() {
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    print(currentOTPCode);
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    Navigator.pushNamed(context, '/CreatePasswordPage');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreatePasswordPage(
          userAction: widget.userAction,
          titlePage: widget.titlePage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: widget.titlePage ?? 'Xác nhận OTP',
        onBackPress: () => Navigator.of(context).pop(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _body(context),
                SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: MediaQuery.of(context).viewInsets.bottom == 0
                ? SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: CustomButton(
                        content: 'Tiếp tục',
                        isEnabled: isValidCurrentOTPCode() ? true : false,
                        action: submitHandler,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
