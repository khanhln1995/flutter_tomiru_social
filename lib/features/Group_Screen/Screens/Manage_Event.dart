import 'package:flutter/material.dart';
import "package:tomiru_social_flutter/features/Group_Screen/Screens/Event_Test.dart";
import "package:tomiru_social_flutter/features/Group_Screen/Screens/Pick_Group.dart";
import "package:tomiru_social_flutter/features/Group_Screen/Widgets/square_button.dart";

// Import EventExist widget từ file riêng
 // Đảm bảo đường dẫn import là chính xác

class ManageEvent extends StatefulWidget {
  @override
  _ManageEventState createState() => _ManageEventState();
}

class _ManageEventState extends State<ManageEvent> {
  bool _showEventExist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildForYouTab(),
    );
  }

  Widget _buildForYouTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!_showEventExist) ...[
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 30),
            child: Image.asset(
              'assets/images/event_manager.png',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tổ chức sự kiện của riêng bạn',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Hãy mời mọi người cùng tham gia một mục\nđích xã hội, một lễ kỷ niệm hoặc một buổi\ntụ họp thông thường nhé',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
        if (_showEventExist)
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.66, // 67% chiều cao màn hình
            child: EventTest(),
          ), // Tạo instance của EventExist
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment: Alignment.center, // Căn giữa nút
            child: SquareButton(
              onPressed: () {
                // setState(() {
                //   _showEventExist = true;
                // });
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PickGroup() ));
              },
              buttonText: 'Tạo sự kiện',
              buttonColor: Color.fromARGB(197, 255, 115, 29),
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}