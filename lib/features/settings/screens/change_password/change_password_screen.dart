import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/settings/widgets/custom_card_widget.dart';
import 'package:tomiru_social_flutter/features/settings/widgets/custom_bottom_sheet_widget.dart';
import 'package:tomiru_social_flutter/features/settings/screens/change_password/enter_old_password_screen.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomChangePassword extends StatefulWidget {
  const CustomChangePassword({super.key});

  @override
  State<CustomChangePassword> createState() => _CustomChangePasswordState();
}

class _CustomChangePasswordState extends State<CustomChangePassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomCard(
      iconLeading: Icons.location_on_outlined,
      title: 'Đổi mật khẩu',
      trailing: Icon(Icons.arrow_forward_ios_rounded,
          color: CustomAppColor.iconTrailing),
      action: () => OpenBottomSheet(
        context,
        Container(),
        Container(),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.02),
              child: Column(
                children: [
                  Text('Đổi mật khẩu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 20)),
                  Text('Mật khẩu dùng để bảo mật và xác thực tài khoản',
                      style: TextStyle(
                          color: CustomAppColor.textButtonInActive,
                          fontSize: size.width / 29)),
                ],
              ),
            ),
            EnterOldPassword(),
            // EnterNewPassword(),
          ],
        ),
      ),
    );
  }
}
