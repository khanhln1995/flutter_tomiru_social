import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tomiru_social_flutter/features/Forgot_Password_Screen/link.dart';
import 'package:tomiru_social_flutter/features/Forgot_Password_Screen/widget/OTPVerificationPage.dart';
import 'package:tomiru_social_flutter/widgets/custom_appbar.dart';
import 'package:tomiru_social_flutter/widgets/custom_button.dart';


class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  int? selectedValue;
  late String inputValue;
  late bool isWhatsApp;
  late bool isEmail;
  late bool isSMS;

  @override
  void initState() {
    super.initState();
    selectedValue = 0;
    inputValue = "";
    isWhatsApp = false;
    isEmail = false;
    isSMS = false;
  }

  Widget BodyText() {
    double fontSizeTitle = MediaQuery.of(context).size.width * 0.06;
    double fontSizeSubtitle = MediaQuery.of(context).size.width * 0.04;

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "Khôi phục mật khẩu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSizeTitle,
              color: Colors.black,
              fontFamily: "Avenir",
            ),
          ),
          Text(
            '''Lựa chọn phương thức xác thực
          để tạo mật khẩu mới''',
            style: TextStyle(
              fontSize: fontSizeSubtitle,
              fontFamily: "Avenir",
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget BodyInfo() {
    double imageSize = MediaQuery.of(context).size.width * 0.15;

    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 0),
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: imageSize,
                height: imageSize,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/mark-zuckerberg.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                child: Text(
                  "Dung Dương",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    color: Colors.black,
                    fontFamily: "Avenir",
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 15),
            child: HyperlinkExample(),
          )
        ],
      ),
    );
  }

  Widget BodyRadioBox() {
    double fontSize = MediaQuery.of(context).size.width * 0.05;
    double subtitleSize = MediaQuery.of(context).size.width * 0.03;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Column(
        children: [
          RadioListTile(
            value: 1,
            groupValue: selectedValue,
            title: Text(
              "Gửi qua WhatsApp",
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '''Số điện thoại WhatsApp: *******345
Vui lòng kiểm tra hòm thư để nhận thông tin xác thực''',
              style: TextStyle(
                fontSize: subtitleSize,
                fontFamily: "Avenir",
                color: Colors.grey[400],
              ),
            ),
            onChanged: (int? val) {
              setState(() {
                selectedValue = val;
                inputValue = "+84987654321";
                isWhatsApp = true;
                isEmail = false;
                isSMS = false;
              });
            },
            controlAffinity: ListTileControlAffinity.trailing,
            fillColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.yellowAccent[700]!;
              }
              return Colors.grey[300]!;
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                  width: 2.0,
                  color: selectedValue == 1
                      ? Colors.yellowAccent[700]!
                      : Colors.grey[200]!),
            ),
          ),
          SizedBox(height: 25.0),
          RadioListTile(
            value: 2,
            groupValue: selectedValue,
            title: Text(
              "Gửi qua Email",
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                fontFamily: "Avenir",
              ),
            ),
            subtitle: Text(
              '''Email: nguyenvana@gmail.com
Vui lòng kiểm tra hòm thư để nhận thông tin xác thực''',
              style: TextStyle(
                fontSize: subtitleSize,
                fontFamily: "Avenir",
                color: Colors.grey[400],
              ),
            ),
            onChanged: (int? val) {
              setState(() {
                selectedValue = val;
                inputValue = "nguyenvana@gmail.com";
                isEmail = true;
                isWhatsApp = false;
                isSMS = false;
              });
            },
            fillColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.yellowAccent[700]!;
              }
              return Colors.grey[300]!;
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                  width: 2.0,
                  color: selectedValue == 2
                      ? Colors.yellowAccent[700]!
                      : Colors.grey[200]!),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          SizedBox(height: 25.0),
          RadioListTile(
            value: 3,
            groupValue: selectedValue,
            title: Text(
              "Gửi qua tin nhắn SMS",
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                fontFamily: "Avenir",
              ),
            ),
            subtitle: Text(
              '''Số điện thoại nhận SMS: *******345
Vui lòng kiểm tra hòm thư để nhận thông tin xác thực''',
              style: TextStyle(
                fontSize: subtitleSize,
                fontFamily: "Avenir",
                color: Colors.grey[400],
              ),
            ),
            onChanged: (int? val) {
              setState(() {
                selectedValue = val;
                inputValue = "+84123456789";
                isSMS = true;
                isWhatsApp = false;
                isEmail = false;
              });
            },
            fillColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.yellowAccent[700]!;
              }
              return Colors.grey[300]!;
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                  width: 2.0,
                  color: selectedValue == 3
                      ? Colors.yellowAccent[700]!
                      : Colors.grey[200]!),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ],
      ),
    );
  }

  Widget Body() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 0, top: 30, right: 0, bottom: 0),
      child: Column(
        children: [
          BodyText(),
          BodyInfo(),
          BodyRadioBox(),
          SizedBox(
            height: 60,
          ),
        ],
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
                Body(),
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
                        content: "Gửi",
                        isEnabled: selectedValue != 0,
                        action: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OTPVerificationPage(
                                    isWhatsAppVerification: isWhatsApp,
                                    isEmailVerification: isEmail,
                                    isSmsVerification: isSMS,
                                    infoUser: inputValue,
                                    titlePage: 'Đổi mật khẩu',
                                    userAction: 'changePassword',
                                  )));
                        },
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
