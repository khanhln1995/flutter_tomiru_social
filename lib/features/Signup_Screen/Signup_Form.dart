
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Signup_Screen/Referrer_Info_Page.dart';
import '../../../helper/validator.dart';
import '../../../state/signup_state.dart';
import 'package:provider/provider.dart';


import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input.dart';


class Signup_Form extends StatefulWidget {
  const Signup_Form({
    Key? key,
  }) : super(key: key);

  @override
  State<Signup_Form> createState() => _Signup_FormState();
}

class _Signup_FormState extends State<Signup_Form> {
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _nameController;
  late TextEditingController _birthDateController;
  String _selectedGender = '';
  bool _termsAccepted = false;
  var activeInputName = false;
  Validator validator = Validator();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _nameController = TextEditingController();
    _birthDateController = TextEditingController();
    _isFormValid();
  }

  bool _isFormValid() {
    if (_emailController.text != '' &&
        _phoneController.text != '' &&
        _nameController.text != '' &&
        _birthDateController.text != '' &&
        _selectedGender != '' &&
        _termsAccepted == true) {
      return true;
    }
    return false;
  }

  bool _isValidEmail() {
    String? validationResult = validator.validateEmail(_emailController.text);
    if (validationResult != null) {
      print(validationResult);
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _birthDateController.dispose();
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
            'Nhập thông tin cá nhân',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        _content(context),
        const SizedBox(height: 60),
        Row(
          children: [
            Checkbox(
              value: _termsAccepted,
              activeColor: const Color(0xFFFFD200),
              onChanged: (bool? value) {
                setState(() {
                  _termsAccepted = value!;
                });
              },
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Để tiếp tục, bạn cần đồng ý với những ',
                    ),
                    TextSpan(
                      text: 'Quy định và Điều khoản',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print(
                              '~~~~~~~~~~~~~~~~~~ move to Quy định và Điều khoản ~~~~~~~~~~~~~~~~~~~~~~~~~');
                        },
                    ),
                    const TextSpan(
                      text:
                          ' trong quá trình sử dụng dịch vụ của ứng dụng TOMIRU.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        CustomInputWidget(
          controller: _nameController,
          title: 'Họ và tên',
          inputType: TextInputType.text,
          helpText: _nameController.text == ''
              ? ' Đảm bảo rằng bạn nhập đúng Họ và Tên của mình. Điều này quan trọng để tránh nhầm lẫn hoặc xác minh tài khoản sau này.'
              : '',
          verifyText: _nameController.text != ''
              ? ' Đảm bảo rằng bạn nhập đúng Họ và Tên của mình. Điều này quan trọng để tránh nhầm lẫn hoặc xác minh tài khoản sau này.'
              : '',
          onValueChanged: (value) {
            setState(() {
              _nameController.text = value;
            });
          },
        ),
        const SizedBox(height: 20),
        CustomInputWidget(
          controller: _phoneController,
          title: 'Số điện thoại',
          inputType: TextInputType.number,
          verifyText: validator.validatePhone(_phoneController.text) ?? false
              ? 'Số điện thoại hợp lệ'
              : '',
          onValueChanged: (value) {
            setState(() {
              _phoneController.text = value;
            });
          },
        ),
        const SizedBox(height: 20),
        CustomInputWidget(
          controller: _emailController,
          title: 'Email liện hệ',
          inputType: TextInputType.text,
          verifyText: _isValidEmail() ? 'Email hợp lệ' : '',
          onValueChanged: (value) {
            setState(() {
              _emailController.text = value;
            });
          },
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Giới tính',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<String>(
              value: 'Nam',
              groupValue: _selectedGender,
              activeColor: const Color(0xFFFFD200),
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            const Text(
              'Nam',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 70),
            Radio<String>(
              value: 'Nữ',
              groupValue: _selectedGender,
              activeColor: const Color(0xFFFFD200),
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            const Text(
              'Nữ',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 70),
            Radio<String>(
              value: 'Khác',
              groupValue: _selectedGender,
              activeColor: const Color(0xFFFFD200),
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            const Text(
              'Khác',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        CustomInputWidget(
          controller: _birthDateController,
          title: 'Ngày sinh',
          inputType: TextInputType.text,
          hintText: 'ví dụ 22/04/1989',
          onValueChanged: (value) {
            setState(() {
              _birthDateController.text = value;
            });
          },
        ),
      ],
    );
  }

  void submitHandler() {
    var signupState = Provider.of<SignupState>(context, listen: false);
    signupState.username = _nameController.text;
    signupState.phoneNumber = _phoneController.text;
    signupState.email = _emailController.text;
    signupState.dateOfBirth = _birthDateController.text;
    signupState.gender = _selectedGender;
    // Navigator.pushNamed(context, '/ReferrerInfoPage');
     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReferrerInfoPage(),
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
                        isEnabled: _isFormValid(),
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
