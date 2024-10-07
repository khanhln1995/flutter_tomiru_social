import 'package:flutter/material.dart';

class PageView2 extends StatefulWidget {
  @override
  _PageView2State createState() => _PageView2State();
}

class _PageView2State extends State<PageView2> {
  final paddingTextInTextField = 14.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Pinned Posts Section

            //Group Management Section
            
            Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align right
                children: [
                  RichText(
                    text: TextSpan(
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Online',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '(3)',
                          style: TextStyle(
                              color: Colors.grey), // Đặt màu xám cho (4)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Recent Group Activities Section
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  margin: EdgeInsets.symmetric(
                      horizontal: 10.0), // Adjust margin as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Add rounded corners
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    leading: SizedBox(
                      width: 56, // Đặt chiều rộng mong muốn
                      height: 56, // Đặt chiều cao mong muốn
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/mark-zuckerberg.jpg'),
                      ),
                    ),
                    title: Text(
                      'Nguyễn Hữu Kiên',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                        Text('Khách hàng', style: TextStyle(fontSize: 12)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.call_outlined),
                          onPressed: () {
                            // Handle settings action
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.videocam_outlined),
                          onPressed: () {
                            // Handle message action
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          
          ],
        ),
      ),
    );
  }
}
