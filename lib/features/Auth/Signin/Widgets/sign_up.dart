import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Auth/Signup/Screens/Signup_Screen.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Bạn chưa có tài khoản? ',
        children: [
          TextSpan(
            text: 'Đăng ký',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Signup_Screen()));
              },
          ),
        ],
      ),
    );
  }
}
