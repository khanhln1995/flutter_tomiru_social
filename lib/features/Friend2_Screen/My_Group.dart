import 'package:flutter/material.dart';

class MyGroup extends StatefulWidget {
  @override
  _MyGroupState createState() => _MyGroupState();
}

class _MyGroupState extends State<MyGroup> {
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
                            text: 'Đã ghim ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: '(4)',
                          style: TextStyle(
                              color: Colors.grey), // Đặt màu xám cho (4)
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle Edit button press
                    },
                    child: Text(
                      'Chỉnh sửa',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue, // Optional: Add blue color
                      ),
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
                    title: Text('Hội Saler Sun Tower'),
                    subtitle: Text('126 Members - 530 Posts'),
                    trailing: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/Pinned.png', // Replace with your image path
                            width: 30.0, // Adjust width as needed
                            height: 30.0, // Adjust height as needed
                          ),
                          onPressed: () {},
                        )),
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
                  Text(
                    'Nhóm bạn quản lý',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle Edit button press
                    },
                    child: Text(
                      'Tạo',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue, // Optional: Add blue color
                      ),
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
