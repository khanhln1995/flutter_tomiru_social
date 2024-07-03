import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/helper/validator.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/divider_with_text.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/email_login.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/language_button.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/login_button.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/logo.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/remember_me_forgot_password.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/sign_up.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/social_login_buttons.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/widget/custom_text_field.dart';
// import 'package:tomiru_social_flutter/widgets/custom_input.dart';

class SignIn_Screen extends StatefulWidget {
  final TextEditingController? phoneController;
  final TextEditingController passwordController;
  final TextEditingController? emailController;
  final bool isCreatedSuccess;
  const SignIn_Screen(
      {super.key,
      this.phoneController,
      required this.passwordController,
      this.emailController,
      required this.isCreatedSuccess});

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {
   String inputShow = '';
  bool _rememberMe = false;
  bool isSaveUser = false;
  bool isEmailActive = false;
  Validator validator = Validator();

  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.emailController ?? TextEditingController();
    _phoneController = widget.phoneController ?? TextEditingController();

    _emailController.addListener(updateInputShow);
    _phoneController.addListener(updateInputShow);
  }

  void updateInputShow() {
    if (!mounted) return;

    setState(() {
      if (_phoneController.text.isNotEmpty) {
        inputShow = _phoneController.text;
      } else if (_emailController.text.isNotEmpty) {
        inputShow = _emailController.text;
      }
    });
  }

  bool isValidInput() {
    bool isValid = false;
    String? emailError;
    bool? phoneValid;

    if (_emailController.text.isNotEmpty) {
      emailError = validator.validateEmail(_emailController.text);
      isValid = emailError == null;
    }
    if (_phoneController.text.isNotEmpty) {
      phoneValid = validator.validatePhone(_phoneController.text);
      isValid = phoneValid ?? false;
    }

    return isValid;
  }

  bool isValidPass() {
    if (widget.passwordController.text.isNotEmpty &&
        widget.passwordController.text.length > 8) {
      RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
      bool containsSpecialChar =
          specialCharRegex.hasMatch(widget.passwordController.text);
      bool containsSpace = widget.passwordController.text.contains(' ');
      return !containsSpecialChar && !containsSpace;
    }
    return false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                SizedBox(height: 30),
                Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: <Widget>[
                    CustomInputWidget(
                      controller: _emailController,
                      title: 'Email',
                      inputType: TextInputType.emailAddress,
                      onValueChanged: (value) {
                        setState(() {
                          widget.emailController?.text = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    CustomInputWidget(
                      controller: widget.passwordController,
                      title: 'Mật khẩu',
                      inputType: TextInputType.text,
                      isPassword: true,
                      onValueChanged: (value) {
                        setState(() {
                          widget.passwordController.text = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                LoginButton(),
                SizedBox(height: 15),
                RememberMeForgotPassword(
                  rememberMe: _rememberMe,
                  onRememberMeChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                SizedBox(height: 42),
                DividerWithText(text: 'Hoặc đăng nhập bằng'),
                SizedBox(height: 19),
                SocialLoginButtons(),
                SizedBox(height: 41),
                EmailLogin(),
                SizedBox(height: 10),
                Column(children: [
                  Text(
                    'Lưu ý: Hỗ trợ đến ngày 30/06/2024',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                ]),
                SizedBox(height: 52),
                SignUp(),
                SizedBox(height: 20),
                LanguageButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
