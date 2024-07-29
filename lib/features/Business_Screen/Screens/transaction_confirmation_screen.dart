import 'package:flutter/material.dart';

import 'package:tomiru_social_flutter/features/Business_Screen/Widgets/otp_verification.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/cutom_input_event.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart';

class TransactionConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        titleText: null,
        padding: 0,
        widget: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Huỷ giao dịch',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Xác nhận chuyển',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Từ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            ListTile(
              // contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Ellipse 17.png'),
                radius: 27.5,
              ),
              title: Text('Lê Minh Dũng'),
              subtitle: Text('dungx@gmail.com'),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Tới',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
            ListTile(
              // contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Ellipse 17.png'),
                radius: 27.5,
              ),
              title: Text('Giahan'),
              subtitle: Text('Systemtomiru@gmail.com'),
            ),
            const SizedBox(height: 16),
            CustomInputEventWidget(
              controller: TextEditingController(),
              title: 'Lời nhắn',
              hintText: "Lê Minh Dũng chuyển Tomxu",
              inputType: TextInputType.text,
              onValueChanged: (value) {
                // Change event name
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dự kiến:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Ngay tức thì'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Phí giao dịch:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('0 Tomxu'),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
           SizedBox(
              height: 54,
              width: double.infinity,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your registration logic here
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPVerificationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Center(
                    child: Text(
                      'Xác thực bằng mã khoá',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
