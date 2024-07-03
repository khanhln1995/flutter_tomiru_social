import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/Forgot_Password_Screen/Forgot_Password_Screen.dart';

class RememberMeForgotPassword extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;

  RememberMeForgotPassword({
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: onRememberMeChanged,
            ),
            Text('Ghi nhớ'),
          ],
        ),
        TextButton( // Add your forgot password logic here
            onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgetPasswordView()));
            },
          child: Text(
            'Quên mật khẩu?',
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
