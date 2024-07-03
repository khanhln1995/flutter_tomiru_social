import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/Signin_Screent.dart';
import 'package:tomiru_social_flutter/state/signup_state.dart';
import 'package:tomiru_social_flutter/widgets/custom_appbar.dart';
import 'package:tomiru_social_flutter/widgets/custom_button.dart';
import './QRDisplayPage.dart';

class SignupSuccessPage extends StatefulWidget {
  const SignupSuccessPage({Key? key}) : super(key: key);

  @override
  State<SignupSuccessPage> createState() => _SignupSuccessPageState();
}

class _SignupSuccessPageState extends State<SignupSuccessPage> {
    final TextEditingController passwordController = TextEditingController();
  Widget _body(BuildContext context) {
    var signupState = Provider.of<SignupState>(context, listen: false);
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    print(signupState.username);
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/images/icon-sucsses.png',
          ),
          Text(
            'Kích hoạt thành công',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Chào mừng bạn đến với cộng\n đồng thịnh vượng TOMIRU!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Divider(
            color: Color(0xFFEAEAEA),
            thickness: 10,
          ),
          SizedBox(height: 20),
          titleRow('Thông tin của bạn', null, null),
          SizedBox(height: 10),
          infoRow('Họ và tên', signupState.username),
          infoRow('Ngày sinh', signupState.dateOfBirth),
          infoRow('giới tính ', signupState.gender),
          SizedBox(height: 10),
          Divider(
            color: Color(0xFFEAEAEA),
            thickness: 10,
          ),
          SizedBox(height: 20),
          titleRow('Thông tin của bạn', 'Gửi vào sms', sendSMS),
          SizedBox(height: 10),
          infoRow('số điện thoại', signupState.phoneNumber),
          infoRow('email', signupState.email),
          infoRow('Tài khoản đăng nhập', signupState.phoneNumber),
          infoRow('Mật khẩu truy cập', signupState.password),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tình trạng xác thực',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 70),
                Image.asset(
                  'assets/images/icon-sucsses.png',
                  height: 40,
                  width: 40,
                ),
                Text(
                  'Đã xác thực',
                  style: TextStyle(
                    color: Color(0xFF27AE60),
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          infoRow('Mật khẩu truy cập', signupState.password),
          SizedBox(height: 10),
          Divider(
            color: Color(0xFFEAEAEA),
            thickness: 10,
          ),
          SizedBox(height: 20),
          titleRow('Thông tin giới thiệu', 'copy', copyHandler),
          SizedBox(height: 10),
          infoRow('Mã giới thiệu', signupState.referralCode),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Link giới thiệu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 150,
                  child: Text(
                    'https://tomiru.com/ref=Abxxxx',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF196DFF),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF196DFF),
                    ),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
            child: _imgQRcode(),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  void sendSMS() {}
  void copyHandler() {}
  Widget _imgQRcode() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'QR code của tôi :',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 150,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue, width: 2)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => QRDisplayPage(
                        imagePath: 'assets/images/icon-QRcode.png'),
                  ));
                },
                child: Text(
                  'Thông tin mã QR',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                QRDisplayPage(imagePath: 'assets/images/icon-QRcode.png'),  
          ));
        },
        child: Image.asset(
          'assets/images/icon-QRcode.png',
          height: 150,
          width: 150,
        ),
      ),
    ]);
  }

  Widget infoRow(
    String title,
    String content,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 35),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleRow(String title, String? content, VoidCallback? action) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (content != null && content.isNotEmpty)
            GestureDetector(
              onTap: action,
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF196DFF),
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF196DFF),
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void submitHandler() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignIn_Screen(
        passwordController: passwordController,
        isCreatedSuccess: true,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Đăng ký',
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
                        action: submitHandler,
                        content: 'Đăng nhập ngay',
                        isEnabled: true,
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
