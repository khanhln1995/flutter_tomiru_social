import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_divider_with_text.dart';
import '../../../../widgets/custom_selector.dart';
import "sign_up_form.dart";
class Signup_Screen extends StatefulWidget {
  final VoidCallback? loginCallback;

  const Signup_Screen({Key? key, this.loginCallback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  String selectedMethod = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/logo-tomiru.jpg',
                  width: 150,
                  height: 150,
                ),
              ),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Đăng ký tài khoản ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Mới',
                        style: TextStyle(
                          color: Color(0xFFF4821F),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Đăng ký mới tài khoản trên App Tomiru\nvới thông tin cá nhân của bạn.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFBBBBBB),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomSelector(
                iconOrImage: ('assets/images/icon-tomiru.png'),
                title: 'Tomiru ID',
                isSelected: selectedMethod == 'tomiru',
                onTap: () {
                  setState(() {
                    if (selectedMethod != 'tomiru') {
                      selectedMethod = 'tomiru';
                    } else {
                      selectedMethod = '';
                    }
                  });
                },
              ),
              const SizedBox(height: 25),
              const DividerWithText(
                content: 'Hoặc đăng ký tài khoản',
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: _text(),
              ),
              const SizedBox(height: 40),
              CustomSelector(
                iconOrImage: ('assets/images/google_logo.png'),
                title: 'Google',
                isSelected: selectedMethod == 'google',
                onTap: () {
                  setState(() {
                    if (selectedMethod != 'google') {
                      selectedMethod = 'google';
                    } else {
                      selectedMethod = '';
                    }
                  });
                },
              ),
              const SizedBox(height: 25),
              CustomSelector(
                iconOrImage: ('assets/images/logo-fb.png'),
                title: 'FaceBook',
                isSelected: selectedMethod == 'facebook',
                onTap: () {
                  setState(() {
                    if (selectedMethod != 'facebook') {
                      selectedMethod = 'facebook';
                    } else {
                      selectedMethod = '';
                    }
                  });
                },
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomButton(
                  content: 'Bắt đầu',
                  isEnabled: selectedMethod == '' ? false : true,
                  action: submitHandler,
                 
                  
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Đăng ký mới tài khoản trên ',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
          children: <TextSpan>[
            const TextSpan(
              text: 'App Tomiru',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: ' thông qua tài khoản ',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            const TextSpan(
              text: 'Google',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: ' và ',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            const TextSpan(
              text: 'Facebook',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitHandler() {
    if (selectedMethod == 'tomiru') {
      // Navigator.pushNamed(context, '/Signup_Form');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Signup_Form(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _body(context)),
    );
  }
}
