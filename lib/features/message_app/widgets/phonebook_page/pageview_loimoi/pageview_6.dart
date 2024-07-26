import 'package:flutter/material.dart';

class PageView6 extends StatefulWidget {
  const PageView6({super.key});

  @override
  _PageView6State createState() => _PageView6State();
}

class _PageView6State extends State<PageView6> {
  final paddingTextInTextField = 14.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align right
                children: [
                  RichText(
                    text: const TextSpan(
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'A', style: TextStyle(color: Colors.black)),
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
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0), // Adjust margin as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Add rounded corners
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    leading: const SizedBox(
                      width: 56, // Đặt chiều rộng mong muốn
                      height: 56, // Đặt chiều cao mong muốn
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/mark-zuckerberg.jpg'),
                      ),
                    ),
                    title: const Text(
                      'Việt Anh',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Khách hàng',
                        style: TextStyle(fontSize: 12)),
                    trailing: TextButton(
                      onPressed: () {
                        // Handle the "Kết bạn" action
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Thu hồi',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align right
                children: [
                  RichText(
                    text: const TextSpan(
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'B', style: TextStyle(color: Colors.black)),
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
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0), // Adjust margin as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Add rounded corners
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    leading: const SizedBox(
                      width: 56, // Đặt chiều rộng mong muốn
                      height: 56, // Đặt chiều cao mong muốn
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/mark-zuckerberg.jpg'),
                      ),
                    ),
                    title: const Text(
                      'Bình',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Khách hàng',
                        style: TextStyle(fontSize: 12)),
                    trailing: TextButton(
                      onPressed: () {
                        // Handle the "Kết bạn" action
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Thu hồi',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align right
                children: [
                  RichText(
                    text: const TextSpan(
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'C', style: TextStyle(color: Colors.black)),
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
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  // padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0), // Adjust margin as needed
                  decoration: BoxDecoration(
                    color: Colors.white, // Set background color
                    borderRadius:
                        BorderRadius.circular(10.0), // Add rounded corners
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    leading: const SizedBox(
                      width: 56, // Đặt chiều rộng mong muốn
                      height: 56, // Đặt chiều cao mong muốn
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/mark-zuckerberg.jpg'),
                      ),
                    ),
                    title: const Text(
                      'Công An',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Khách hàng',
                        style: TextStyle(fontSize: 12)),
                    trailing: TextButton(
                      onPressed: () {
                        // Handle the "Kết bạn" action
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Thu hồi',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
