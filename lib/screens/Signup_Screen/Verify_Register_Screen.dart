import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../helper/validator.dart';

import './OTP_Verify_Screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';

import '../../widgets/custom_appbar.dart';


class VerifyRegistrationPage extends StatefulWidget {
  const VerifyRegistrationPage({Key? key}) : super(key: key);

  @override
  State<VerifyRegistrationPage> createState() => _VerifyRegistrationPageState();
}

class _VerifyRegistrationPageState extends State<VerifyRegistrationPage> {
  late TextEditingController _inputController;
  bool _isEmailVerification = false;
  
  Validator validator = Validator();
  @override
  void initState() {
    _inputController = TextEditingController();
    super.initState();
  }

  bool isValidInput() {
    if (_isEmailVerification) {
      String? emailValidationResult =
          validator.validateEmail(_inputController.text);
      return emailValidationResult == null;
    } else {
      return validator.validatePhone(_inputController.text) ?? false;
    }
  }

  Widget _body(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: _text(),
          ),
          const SizedBox(height: 40),
          CustomInputWidget(
              controller: _inputController,
              title: _isEmailVerification ? 'Email của bạn' : 'Số điện thoại',
              inputType: _isEmailVerification
                  ? TextInputType.emailAddress
                  : TextInputType.number,
              verifyText: isValidInput()
                  ? _isEmailVerification
                      ? 'Email hợp lệ'
                      : 'Số điện thoại hợp lệ'
                  : '',
              onValueChanged: (value) {
                setState(() {
                  _inputController.text = value;
                });
              }),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                  print("              Coming Soon...");
                  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                },
                child: Text(
                  _isEmailVerification
                      ? 'Tôi muốn dùng Email khác?'
                      : 'Tôi muốn dùng số điện thoại khác?',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 260),
          _verificationText(),
          const SizedBox(height: 20),
        ]);
  }

  void submitHandler() {
    print('~~~~~~~~~~~~~~~~~~~~~~~ submit ~~~~~~~~~~~~~~~~~~~~~~~~~');
    print('Gửi OTP qua email : ${_isEmailVerification}');
    print('phone/email : ${_inputController.text}');
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPVerificationPage(
          isEmailVerification: _isEmailVerification,
          isSmsVerification: !_isEmailVerification,
          infoUser: _inputController.text,
          titlePage: 'Đăng ký thành viên',
          userAction: 'created-user',
        ),
      ),
    );
  }

  Widget _verificationText() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
              text: _isEmailVerification
                  ? 'Xác thực qua Số điện thoại ?'
                  : 'Xác thực qua Email ?'),
          TextSpan(
            text: _isEmailVerification
                ? 'Xác thực Số điện thoại'
                : ' Xác thực Email',
            style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  _isEmailVerification = !_isEmailVerification;
                  _inputController.clear();
                });
              },
          ),
        ],
      ),
    );
  }

  Widget _text() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        const Center(
          child: Text(
            'Xác thực tài khoản',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
            'Xác thực tài khoản trong mạng xã hội Tomiru mang lại lợi ích về bảo mật, bảo vệ thông tin cá nhân, xác nhận đáng tin cậy,  giúp xây dựng một mạng xã hội an toàn, đáng tin cậy và tạo ra trải nghiệm tốt hơn cho các thành viên. ',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            )),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
              print("              Coming Soon...");
              print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            },
            child: const Text(
              'Tìm hiểu về lợi ích xác thực ?',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
                        isEnabled: isValidInput() ? true : false,
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
