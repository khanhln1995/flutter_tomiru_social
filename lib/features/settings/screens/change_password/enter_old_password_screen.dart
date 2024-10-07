import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/settings/widgets/custom_elevated_button_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class EnterOldPassword extends StatefulWidget {
  const EnterOldPassword({super.key});

  @override
  State<EnterOldPassword> createState() => _EnterOldPasswordState();
}

class _EnterOldPasswordState extends State<EnterOldPassword> {
  final TextEditingController _controller = TextEditingController();
  late bool _isButtonActive;

  @override
  void initState() {
    super.initState();
    _isButtonActive = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: size.height * 0.015),
          child: TextField(
            controller: _controller,
            obscureText: true,
            onChanged: (value) => setState(() {
              _isButtonActive = value.isNotEmpty;
            }),
            cursorColor: CustomAppColor.cursorColor,
            decoration: InputDecoration(
              hintText: "Nhập mật khẩu của bạn",
              hintStyle: TextStyle(
                color: CustomAppColor.textFieldChat,
                fontSize: size.width / 30,
              ),
              contentPadding: EdgeInsets.only(
                  top: size.height / 50,
                  left: size.width / 30,
                  right: size.width / 30),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: CustomAppColor.textFieldChat,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: CustomAppColor.textFieldChat,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(
                  color: CustomAppColor.textFieldChatSelected,
                  width: 1.0,
                ),
              ),
              filled: true,
              fillColor: CustomAppColor.backgroundTextField,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Text('Quên mật khẩu',
                          style: TextStyle(
                              color: CustomAppColor.textButtonActive))),
                ],
              ),
            ),
            CustomElevatedButton(
              textButton: 'Xác thực',
              width: double.infinity,
              height: size.height / 17,
              onPressed: _isButtonActive ? () {} : null,
              backgroundColor: _isButtonActive
                  ? CustomAppColor.backgroundElevatedButtonActive
                  : CustomAppColor.backgroundElevatedButtonInActive,
              textColor: _isButtonActive
                  ? CustomAppColor.textElevatedButtonActive
                  : CustomAppColor.textButtonInActive,
            ),
          ],
        ),
      ],
    );
  }
}
