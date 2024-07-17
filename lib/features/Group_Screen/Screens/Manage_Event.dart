import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Event_Test.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Pick_Group.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/square_button.dart';

class ManageEvent extends StatefulWidget {
  final bool showEventExist;

  ManageEvent({ this.showEventExist = false, Key? key}) : super(key: key);

  @override
  _ManageEventState createState() => _ManageEventState();
}

class _ManageEventState extends State<ManageEvent> {
   bool showEventExist = false;

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
      if (!widget.showEventExist && !showEventExist) ...[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 30),
          child: Image.asset(
            'assets/images/event_manager.png',
            fit: BoxFit.contain,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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
      if (widget.showEventExist || showEventExist) ...[
        SizedBox(
          height: MediaQuery.of(context).size.height *
              0.66, // 16% chiều cao màn hình
          child: EventTest(),
        ),
        Spacer(),
      ],
       Spacer(),
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Align(
          alignment: Alignment.center,
          child: SquareButton(
            onPressed: () {
              // setState(() {
              //   showEventExist = true;
              // });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickGroup(),
                  ),
                );
            },
            buttonText: 'Tạo sự kiện',
            buttonColor: const Color.fromARGB(197, 255, 115, 29),
            textColor: Colors.white,
          ),
        ),
      ),
    ],
  );
}}