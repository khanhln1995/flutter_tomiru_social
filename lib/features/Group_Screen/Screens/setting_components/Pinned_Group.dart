import 'package:flutter/material.dart';

class PinnedGroup extends StatefulWidget {
  const PinnedGroup({super.key});

  @override
  _PinnedGroupState createState() => _PinnedGroupState();
}

class _PinnedGroupState extends State<PinnedGroup> {
  final paddingTextInTextField = 14.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              title: const Text("Ghim nhóm", style:TextStyle(fontWeight: FontWeight.bold)),
              
            ),
            
      body: SingleChildScrollView(
        child: Column(       
          children: [
              Divider(
              thickness: 2,
              color: Colors.grey[200],
            ),
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
                            text: 'Nhóm đã ghim ',
                            style: TextStyle(color: Colors.black)),
                         TextSpan(
                          text: '(4)',
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
                            AssetImage('assets/images/icon-tomiru-appbar.jpg'),
                      ),
                    ),
                    title: const Text('Hội Saler Sun Tower'),
                    subtitle: const Text('126 Members - 530 Posts'),
                    trailing: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align right
                children: [
                  const Text(
                    'Nhóm bạn đã tham gia',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 16),
            FractionallySizedBox(
              // Bọc TextField trong FractionallySizedBox
              widthFactor: 0.9, // Chiều rộng 80% màn hình
              child: SizedBox(
                  width: 38,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 128, 126, 126),
                      ),
                      hintText: "Tìm tên",
                      hintStyle: const TextStyle(
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
                      fillColor: const Color.fromARGB(255, 245, 244, 244),
                    ),
                  )),
            ),
            //Recent Group Activities Section
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
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
                            AssetImage('assets/images/icon-tomiru-appbar.jpg'),
                      ),
                    ),
                    title: const Text('Hội Saler Sun Tower'),
                    subtitle: const Text('126 Members - 530 Posts'),
                    trailing: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: IconButton(
                          icon: Image.asset(
                            'assets/images/Unpin.png', // Replace with your image path
                            width: 30.0, // Adjust width as needed
                            height: 30.0, // Adjust height as needed
                          ),
                          onPressed: () {},
                        )),
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
