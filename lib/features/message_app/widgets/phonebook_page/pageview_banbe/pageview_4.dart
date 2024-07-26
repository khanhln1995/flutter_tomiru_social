import 'package:flutter/material.dart';

class PageView4 extends StatefulWidget {
  @override
  _PageView4State createState() => _PageView4State();
}

class _PageView4State extends State<PageView4> {
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
                            text: 'Chờ kết bạn',
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
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
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
                        TextButton(
                          onPressed: () {
                            // Handle the "Đồng ý" action
                          },
                          child: Text(
                            'Đồng ý',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 8), // Add some space between the buttons
                        TextButton(
                          onPressed: () {
                            // Handle the "Từ chối" action
                          },
                          child: Text(
                            'Từ chối',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
