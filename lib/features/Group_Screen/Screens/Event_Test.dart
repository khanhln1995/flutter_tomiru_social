import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/square_button.dart';

class EventTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.translate(
        offset: Offset(0, -35),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.8,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Đường viền màu xám
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(
                        'Tomiru',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Sự kiện do Nguyen Nhung tạo'),
                    ),
                    Image.asset('assets/images/Firefly.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đang bắt đầu',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Sự kiện khai trương',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10.0), // Khoảng cách so với đáy màn hình
                          child: SquareButton(
                            onPressed: () {},
                            buttonText: 'Chia sẻ',
                            buttonColor: Color.fromARGB(197, 201, 201, 201),
                            textColor: const Color.fromARGB(255, 0, 0, 0),
                            width: 340,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
