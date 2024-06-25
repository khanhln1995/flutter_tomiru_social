import 'package:flutter/material.dart';
import '../../state/signup_state.dart';

// import 'package:flutter_twitter_clone/ui/page/Auth/signin.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'QR_Display_Screen.dart';

class SignupSuccessPage extends StatefulWidget {
  const SignupSuccessPage({Key? key}) : super(key: key);

  @override
  State<SignupSuccessPage> createState() => _SignupSuccessPageState();
}

class _SignupSuccessPageState extends State<SignupSuccessPage> {
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
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/icon-sucsses.png',
          ),
          const Text(
            'Kích hoạt thành công',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Chào mừng bạn đến với cộng\n đồng thịnh vượng TOMIRU!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFFEAEAEA),
            thickness: 10,
          ),
          const SizedBox(height: 20),
          titleRow('Thông tin của bạn', null, null),
          const SizedBox(height: 10),
          infoRow('Họ và tên', signupState.username),
          infoRow('Ngày sinh', signupState.dateOfBirth),
          infoRow('giới tính ', signupState.gender),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xFFEAEAEA),
            thickness: 10,
          ),
          const SizedBox(height: 20),
          titleRow('Thông tin của bạn', 'Gửi vào sms', sendSMS),
          const SizedBox(height: 10),
          infoRow('số điện thoại', signupState.phoneNumber),
          infoRow('email', signupState.email),
          infoRow('Tài khoản đăng nhập', signupState.phoneNumber),
          infoRow('Mật khẩu truy cập', signupState.password),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tình trạng xác thực',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 70),
                Image.asset(
                  'assets/images/icon-sucsses.png',
                  height: 40,
                  width: 40,
                ),
                const Text(
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
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xFFEAEAEA),
            thickness: 10,
          ),
          const SizedBox(height: 20),
          titleRow('Thông tin giới thiệu', 'copy', copyHandler),
          const SizedBox(height: 10),
          infoRow('Mã giới thiệu', signupState.referralCode),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Link giới thiệu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 150,
                  child: const Text(
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
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
            child: _imgQRcode(),
          ),
          const SizedBox(height: 30),
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
            const Text(
              'QR code của tôi :',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 150,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue, width: 2)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRDisplayPage(
                        imagePath: 'assets/images/icon-QRcode.png'),
                  ));
                },
                child: const Text(
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
                const QRDisplayPage(imagePath: 'assets/images/icon-QRcode.png'),
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 35),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleRow(String title, String? content, VoidCallback? action) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (content != null && content.isNotEmpty)
            GestureDetector(
              onTap: action,
              child: Text(
                content,
                style: const TextStyle(
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
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => SignIn(
    //     isCreatedSuccess: true,
    //   ),
    // ));
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
                        action: submitHandler,
                        content: 'Đăng nhập ngay',
                        isEnabled: true,
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
