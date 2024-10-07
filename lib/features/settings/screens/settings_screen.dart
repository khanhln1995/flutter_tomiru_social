import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_app_bar_widget.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_inline_widget.dart';
import 'package:tomiru_social_flutter/features/settings/widgets/custom_card_widget.dart';
import 'package:tomiru_social_flutter/features/settings/widgets/custom_drop_down_widget.dart';
import 'package:tomiru_social_flutter/features/settings/screens/change_password/change_password_screen.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height / 13.6),
          child: CustomAppbar(
            title: 'Cài đặt',
            redirect: () => Navigator.pop(context),
          )),
      body: Column(
        children: [
          CustomInline(width: double.infinity),
          Expanded(
            flex: 9,
            child: Container(
              color: CustomAppColor.backgroundSetting,
              padding: EdgeInsets.only(top: size.height / 60),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: size.height / 80),
                    child: CustomCard(
                      iconLeading: Icons.location_on_outlined,
                      title: 'Sổ địa chỉ',
                      trailing: Icon(Icons.arrow_forward_ios_rounded,
                          color: CustomAppColor.iconTrailing),
                      action: () {},
                    ),
                  ),
                  Container(
                    color: CustomAppColor.backgroundListTile,
                    margin: EdgeInsets.only(bottom: size.height / 80),
                    child: Column(
                      children: [
                        CustomChangePassword(),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.065),
                          child: CustomInline(width: size.width * 0.787),
                        ),
                        CustomCard(
                          iconLeading: Icons.location_on_outlined,
                          title: 'Bật xác thực bảo mật 2 lớp',
                          trailing: Icon(Icons.arrow_forward_ios_rounded,
                              color: CustomAppColor.iconTrailing),
                          action: () {},
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.065),
                          child: CustomInline(width: size.width * 0.787),
                        ),
                        CustomCard(
                          iconLeading: Icons.location_on_outlined,
                          title: 'Sửa thông tin cá nhân',
                          trailing: Icon(Icons.arrow_forward_ios_rounded,
                              color: CustomAppColor.iconTrailing),
                          action: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height / 80),
                    child: CustomCard(
                      iconLeading: Icons.location_on_outlined,
                      title: 'Hướng dẫn sử dụng',
                      trailing: Icon(Icons.arrow_forward_ios_rounded,
                          color: CustomAppColor.iconTrailing),
                      action: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height / 80),
                    child: CustomCard(
                      iconLeading: Icons.location_on_outlined,
                      title: 'Ngôn ngữ',
                      trailing: CustomDropdown(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height / 80),
                    child: CustomCard(
                      iconLeading: Icons.location_on_outlined,
                      title: 'Trung tâm trợ giúp',
                      trailing: Icon(Icons.arrow_forward_ios_rounded,
                          color: CustomAppColor.iconTrailing),
                      action: () {},
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: size.height / 50),
                        child: CustomCard(
                          iconLeading: Icons.location_on_outlined,
                          title: 'Đăng xuất',
                          action: () {
                            Get.find<AuthController>().logout();
                          },
                        ),
                      ),
                      Text("Phiên bản 18.1",
                          style: TextStyle(color: CustomAppColor.versionText))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
