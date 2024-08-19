import 'package:flutter/material.dart';
import "package:tomiru_social_flutter/features/group/Screens/Manage_My_Group.dart";

class ManageGroup extends StatefulWidget {
  const ManageGroup({super.key});

  @override
  _ManageGroupState createState() => _ManageGroupState();
}

class _ManageGroupState extends State<ManageGroup> {
  final paddingTextInTextField = 14.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Recent Group Activities Section
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageMyGroup()),
                      );
                    },
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    leading: const SizedBox(
                      width: 56, // Đặt chiều rộng mong muốn
                      height: 56, // Đặt chiều cao mong muốn
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/icon-tomiru-appbar.jpg'),
                      ),
                    ),
                    title: const Text('Hội Saler Sun Tower'),
                    subtitle: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Nhóm riêng tư ',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(text: '- 1 thành viên'),
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right, size: 30),
                  ),
                );
              },
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.92, //
                child: Container(
                  color: const Color.fromARGB(255, 243, 241, 241),
                  height: 8,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align right
                children: [
                  Text(
                    'Cần xét duyệt',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final List<String> titles = [
                  'Nội dung bị báo cáo',
                  'Đang chờ phê duyệt',
                  'Yêu cầu làm thành viên',
                  'Thông báo kiểm duyệt',
                ];
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
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    leading: const SizedBox(
                      width: 40, // Đặt chiều rộng mong muốn
                      height: 40, // Đặt chiều cao mong muốn
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/icon-tomiru-appbar.jpg'),
                      ),
                    ),
                    title: Text(titles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('0 mục mới hôm nay'),
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
