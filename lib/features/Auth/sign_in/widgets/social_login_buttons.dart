import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 180,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              // Add your Google login logic here
            },
            icon:
                Image.asset('assets/images/google_logo.png', width: 24, height: 24),
            label: Text('Google'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 180,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              // Add your Facebook login logic here
            },
            icon:
                Image.asset('assets/images/logo-fb.png', width: 24, height: 24),
            label: Text('Facebook'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
