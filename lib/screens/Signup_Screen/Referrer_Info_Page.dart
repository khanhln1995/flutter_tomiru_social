import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../state/signup_state.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_input.dart';

import 'package:provider/provider.dart';

import '../../widgets/custom_selector.dart';
import "Verify_Register_Screen.dart";

class ReferrerInfoPage extends StatefulWidget {
  const ReferrerInfoPage({Key? key}) : super(key: key);

  @override
  State<ReferrerInfoPage> createState() => _ReferrerInfoPageState();
}

class _ReferrerInfoPageState extends State<ReferrerInfoPage> {
  late TextEditingController _inputController;
  String selectedMethod = 'user';

  @override
  void initState() {
    _inputController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              'Thông tin người giới thiệu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Text(
                'Nhập thông tin của người giới thiệu để tham gia vào hệ thống mạng lưới thành viên của TOMIRU',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ),
          const SizedBox(height: 30),
          CustomSelector(
            title: 'Thông qua người giới thiệu',
            isSelected: selectedMethod == 'user' ? true : false,
            backgroundColor: selectedMethod == 'user'
                ? Colors.yellow[100]!
                : Colors.grey[100]!,
            height: 71,
            borderRadius: 20,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            onTap: () {
              setState(() {
                if (selectedMethod != 'user') {
                  selectedMethod = 'user';
                }
              });
            },
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomInputWidget(
                    title: 'Nhập mã giới thiệu',
                    hintText: 'Nhập mã giới thiệu',
                    verifyText: validInput() ? 'Mã giới thiệu hợp lệ' : '',
                    inputType: TextInputType.text,
                    controller: _inputController,
                    onValueChanged: (value) {
                      setState(() {
                        _inputController.text = value;
                      });
                    }),
              ),
              _imageQR(context),
            ],
          ),
          const SizedBox(height: 10),
          CustomSelector(
            title: 'Tự đăng ký',
            isSelected: selectedMethod == 'no-user' ? true : false,
            backgroundColor: selectedMethod == 'no-user'
                ? const Color.fromARGB(255, 241, 224, 151)
                : const Color(0xF5F5F5),
            height: 71,
            borderRadius: 20,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            onTap: () {
              setState(() {
                if (selectedMethod != 'no-user') {
                  selectedMethod = 'no-user';
                }
              });
            },
          ),
          const SizedBox(height: 20),
          _text(),
          const SizedBox(
            height: 90,
          ),
        ]);
  }

  void submitHandler() {
    print('~~~~~~~~~~~~~~~~~~~~~~~ submit ~~~~~~~~~~~~~~~~~~~~~~~~~');
    print('Mã giới thiệu : ${_inputController.text}');
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    var signupState = Provider.of<SignupState>(context, listen: false);
    signupState.referralCode = _inputController.text;
    // Navigator.pushNamed(context, '/VerifyRegistrationPage');
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VerifyRegistrationPage(),
      ),
    );
  }

  bool validInput() {
    if (_inputController.text != '' && _inputController.text.length > 6) {
      return true;
    }
    return false;
  }

  Widget _imageQR(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/img-qrcode.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                'Đóng',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 215, 212, 212),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.close,
                                    size: 16, color: Colors.black),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Image.asset('assets/images/img-qrcode.png'),
        ),
      ),
    );
  }

  Widget _text() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            height: 1.5, // Adjust the line spacing
          ),
          children: <TextSpan>[
            const TextSpan(
                text:
                    'Cá nhân tự đăng ký thành viên để Tomiru cung cấp lợi ích về giá cả, chất lượng, cơ hội việc làm, kết nối xã hội và công nghệ tiên tiến cho các thành viên tham gia mạng xã hội này.'),
            const TextSpan(
                text:
                    '\n\nTìm hiểu lợi ích khi tham gia là thành viên của Tomiru? ',
                style: TextStyle(fontWeight: FontWeight.w300)),
            TextSpan(
                text: 'Tìm hiểu ngay',
                style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Learn more tapped!");
                  }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Đăng ký thành viên',
        onBackPress: () => Navigator.of(context).pop(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _body(context),
                const SizedBox(height: 80),
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
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: CustomButton(
                        content: 'Tiếp tục',
                        isEnabled: selectedMethod == 'no-user'
                            ? true
                            : validInput()
                                ? true
                                : false,
                        action: submitHandler,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
