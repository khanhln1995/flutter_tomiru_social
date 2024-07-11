import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomiru_social_flutter/helper/validator.dart';
import 'package:tomiru_social_flutter/features/Forgot_Password_Screen/congraturation-view.dart';
import 'package:tomiru_social_flutter/features/Signin_Screen/widget/custom_text_field.dart';
import 'package:tomiru_social_flutter/features/Signup_Screen/SignupSuccessPage.dart';
import 'package:tomiru_social_flutter/state/signup_state.dart';
import 'package:tomiru_social_flutter/widgets/custom_appbar.dart';
import 'package:tomiru_social_flutter/widgets/custom_button.dart';


class CreatePasswordPage extends StatefulWidget {
  final String? userAction;
  final String? titlePage;
  const CreatePasswordPage({Key? key, this.userAction, this.titlePage})
      : super(key: key);

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage>
    with SingleTickerProviderStateMixin {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool showText = false;
  bool _isRememberPasswordChecked = false;

  Validator validator = Validator();
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return Column(children: [
      SizedBox(height: 20),
      Center(
        child: Text(
          'Thiết lập mật khẩu',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 15),
      Center(
        child: Text(
          "Vui lòng thiết lập mật khẩu để \ntruy cập lần sau",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      _inputForm(),
      SizedBox(height: isConfirmPassword() ? 180 : 230),
      Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: CheckboxListTile(
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Lưu mật khẩu",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(
            "Thông tin mật khẩu đã mã hóa lưu trữ trên thiết bị trong vòng 30 ngày, giúp bạn đăng nhập dễ dàng và nhanh chóng",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 10,
            ),
          ),
          value: _isRememberPasswordChecked,
          onChanged: (bool? value) {
            setState(() {
              _isRememberPasswordChecked = value!;
              savePassword();
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Color(0xFFFFD200),
          checkColor: Colors.white,
          contentPadding: EdgeInsets.zero,
        ),
      ),
      SizedBox(height: 20),
    ]);
  }

  void savePassword() {}
  bool isConfirmPassword() {
    if (_confirmPasswordController.text == '' &&
        _passwordController.text == '') {
      return false;
    }
    if (_confirmPasswordController.text == _passwordController.text) {
      return true;
    }
    return false;
  }

  Widget _inputForm() {
    return Column(
      children: [
        CustomInputWidget(
            title: 'Mật khẩu',
            inputType: TextInputType.text,
            isPassword: true,
            hintText: 'Nhập mật khẩu của bạn',
            onValueChanged: (value) {
              setState(() {
                _passwordController.text = value;
              });
            },
            controller: _passwordController),
        SizedBox(height: 20),
        _message('Mật khẩu hợp lệ',
            validator.isValidPassword(_passwordController.text)),
        if (_passwordController.text != '' && !isConfirmPassword())
          Padding(
            padding: EdgeInsets.only(right: 55, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("• Mật khẩu phải có độ dài tối thiểu: ít nhất 8 ký tự",
                    style: TextStyle(fontSize: 12)),
                SizedBox(height: 8),
                Text("• Mật khẩu không chứa ký tự đặc biệt",
                    style: TextStyle(fontSize: 12)),
                SizedBox(height: 8),
                Text("• Mật khẩu không trùng với mật khẩu cũ",
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        SizedBox(height: 20),
        CustomInputWidget(
            title: 'Xác nhận lại mật khẩu',
            inputType: TextInputType.text,
            hintText: 'Nhập mật khẩu của bạn',
            isPassword: true,
            onValueChanged: (value) {
              setState(() {
                _confirmPasswordController.text = value;
              });
            },
            controller: _confirmPasswordController),
        _message('Xác nhận mật khẩu hợp lệ', isConfirmPassword()),
      ],
    );
  }

  Widget _message(message, visible) {
    return Visibility(
      visible: visible,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Image.asset('assets/images/icon-verify-check.png',
                height: 24, width: 24),
          ),
          Expanded(
            child: Text(
              message,
              softWrap: true,
              overflow: TextOverflow.clip,
              style: TextStyle(color: Color(0xFF3E9462)),
            ),
          ),
        ],
      ),
    );
  }

  void submitHandler() {
    var signupState = Provider.of<SignupState>(context, listen: false);
    signupState.password = _passwordController.text;
    if (widget.userAction == 'created-user') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignupSuccessPage(),
        ),
      );
    }
    if (widget.userAction == 'changePassword') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CongratulationView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: widget.titlePage ?? 'Thiết lập mật khẩu',
        onBackPress: () => Navigator.of(context).pop(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _body(context),
                SizedBox(height: 80),
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
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: CustomButton(
                        content: 'Hoàn thành',
                        isEnabled: isConfirmPassword() ? true : false,
                        action: submitHandler,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
