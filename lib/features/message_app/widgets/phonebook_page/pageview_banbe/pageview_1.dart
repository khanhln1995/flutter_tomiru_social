import 'package:flutter/material.dart';

class PageView1 extends StatefulWidget {
  @override
  _PageView1State createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
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
                            text: 'Mới',
                            style: TextStyle(color: Colors.black)),
                       
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
                            AssetImage('assets/images/icon-tomiru-appbar.jpg'),
                      ),
                    ),
                    title: Text('Nguyễn Hữu Kiên',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    subtitle: Text('Khách hàng', style: TextStyle(fontSize: 12)),
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
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.92, //
                child: Container(
                  color: Color.fromARGB(255, 243, 241, 241),
                  height: 2.5,
                ),
              ),
            ),

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
                            text: 'Danh bạ máy',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '(50)',
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
              itemCount: 1,
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
                            AssetImage('assets/images/icon-tomiru-appbar.jpg'),
                      ),
                    ),
                    title: Text('Tomiru'),
                    subtitle: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Mới ',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(text: '- Cập nhật khoảng 1h trước'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.92, //
                child: Container(
                  color: Color.fromARGB(255, 243, 241, 241),
                  height: 2.5,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align right
                children: [
                  Text(
                    'Nhóm bạn đã tham gia',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // Handle Edit button press
                      },
                      child: Icon(
                        Icons.swap_vert,
                        color: Colors.black,
                        size: 30.0,
                      )),
                ],
              ),
            ),
            FractionallySizedBox(
              // Bọc TextField trong FractionallySizedBox
              widthFactor: 0.9, // Chiều rộng 80% màn hình
              child: SizedBox(
                  width: 38,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 128, 126, 126),
                      ),
                      hintText: "Tìm tên",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 128, 126, 126),
                      ),
                      contentPadding: EdgeInsets.only(
                          top: paddingTextInTextField,
                          bottom: paddingTextInTextField),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 244, 244),
                    ),
                  )),
            ),
            //Recent Group Activities Section
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
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
                            AssetImage('assets/images/icon-tomiru-appbar.jpg'),
                      ),
                    ),
                    title: Text('Hội Saler Sun Tower'),
                    subtitle: Text('126 Members - 530 Posts'),
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
