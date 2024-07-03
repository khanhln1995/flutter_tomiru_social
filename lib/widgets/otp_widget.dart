import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class OTPWidget extends StatefulWidget {
  final String? info;
  final bool? isEmailVerification;
  final Function(List<String>) onCodeChanged; // Callback function
  final int initialTime;
  OTPWidget(
      {Key? key,
      this.info,
      this.isEmailVerification,
      this.initialTime = 130,
      required this.onCodeChanged})
      : super(key: key);

  @override
  _OTPWidgetState createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  Timer? timer;
  int remainingTime;
  bool showRedBorder = false;

  _OTPWidgetState() : remainingTime = 130;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialTime ?? 130;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          showRedBorder = true;
        });
        controllers.forEach((controller) {
          controller.clear();
        });
        widget.onCodeChanged(controllers.map((c) => c.text).toList());
      }
    });
  }

  Widget otpInputField(int index) {
    return SizedBox(
      width: 40,
      height: 40,
      child: TextField(
        controller: controllers[index],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: showRedBorder
              ? const OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
              : const OutlineInputBorder(),
          counterText: "",
          hintText: "-",
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.length == 1 && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          widget.onCodeChanged(controllers.map((c) => c.text).toList());
        },
        onTap: () {
          if (showRedBorder) {
            setState(() {
              showRedBorder = false;
            });
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void resendOTP() {
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    print('send OTP to ${widget.info}');
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    setState(() {
      remainingTime = 130;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text:
                'Nhập mã xác thực gồm 6 số đã được gửi SMS \ntới ${widget.isEmailVerification == false ? 'số điện thoại' : 'Email'}  ',
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 12),
            children: <TextSpan>[
              TextSpan(
                text: ' ${widget.info}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              const TextSpan(
                text: 'Thời gian hiệu lực: ',
              ),
              TextSpan(
                text: '${remainingTime} s',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) => otpInputField(index)),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              if (remainingTime == 0) {
                resendOTP();
              }
            },
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontWeight: FontWeight.normal),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.refresh, size: 18),
                SizedBox(width: 4),
                Text('Gửi lại mã'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
