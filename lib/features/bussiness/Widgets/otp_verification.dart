import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/bussiness/Screens/tomxu_status_screen.dart';
import 'dart:async';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  bool _isCodeComplete = false;
  int _resendTimer = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _timer?.cancel();
    super.dispose();
  }

  void _onCodeChanged() {
    setState(() {
      _isCodeComplete =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        titleText: null,
        padding: 0,
        widget: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mã khoá',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Chúng tôi đã gửi mã 5 chữ số đến số điện thoại',
              style: TextStyle(color: Colors.grey),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '096297xxxx. ',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black)),
                  TextSpan(
                    text: 'Vui lòng nhập mã!',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _controllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context).nextFocus();
                      }
                      _onCodeChanged();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                child: Text('Xác nhận',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: _isCodeComplete ? Colors.blue : Colors.grey,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: _isCodeComplete ? () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TomxuStatusScreen(
                    isSuccess: true,
                  )));
                } : null,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: _resendTimer > 0
                  ? Text('Bạn chưa nhận được mã? Gửi lại (${_resendTimer}s)',
                      style: TextStyle(color: Colors.grey))
                  : TextButton(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: 'Bạn chưa nhận được mã?',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: ' Gửi lại',
                              style: TextStyle(
                                color: Colors.purple,
                              )),
                        ]),
                      ),
                      onPressed: () {
                        setState(() {
                          _resendTimer = 30;
                        });
                        startTimer();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
