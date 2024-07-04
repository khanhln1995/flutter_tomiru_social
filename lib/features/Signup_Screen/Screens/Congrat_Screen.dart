import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_twitter_clone/ui/page/Auth/signin.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_appbar.dart';
import 'package:tomiru_social_flutter/features/Signin_Screen/Screens/Signin_Screen.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({Key? key}) : super(key: key);

  Widget SuccessView(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double imageSize = size.width * 0.2;

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 150),
          Container(
            width: imageSize,
            height: imageSize,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/success-icon.png"),
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(height: 20),
          const Text(
            'Đổi mật khẩu thành công!',
            style: TextStyle(
              color: Colors.green,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Chào mừng bạn đến với cộng đồng thịnh vượng TOMIRU!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
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
                SuccessView(context),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MediaQuery.of(context).viewInsets.bottom == 0
                  ? SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: CustomButton(
                          content: "Đăng nhập ngay",
                          isEnabled: true,
                          action: () {
                           
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
