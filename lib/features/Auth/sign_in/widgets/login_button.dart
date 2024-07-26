import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/social_network/Screens/social_network.dart';
class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        
        onPressed: () {
         Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SocialNetwork(
                    
                  )));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Đăng nhập',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
