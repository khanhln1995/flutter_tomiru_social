import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Đăng nhập bằng? ',
        children: [
          TextSpan(
            text: 'Email hoặc tài khoản',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Add your sign up logic here
              },
          ),
        ],
      ),
    );
  }
}
