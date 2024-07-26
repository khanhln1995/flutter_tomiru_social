import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/widgets/ui/custom_mainbar.dart'
    as mainbar;
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Chat_Group_Screen.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAdmin = true;

  void _onListTileTap(String title) {
    // Xử lý sự kiện khi nhấn vào ListTile
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Nhấn vào $title'),
    //     duration: Duration(seconds: 2),
    //   ),
    // );
    // Ví dụ: điều hướng đến trang chi tiết hoặc thực hiện một hành động khác
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatGroupScreen(
                  isAdmin: isAdmin,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: mainbar.CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        mainTitle: 'Tin nhắn mới',
        padding: 0,
        leadingWidth: MediaQuery.of(context).size.width / 3,
        widget: const [],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Ô nhập liệu và chữ "Đến :" nằm cạnh nhau
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Đến :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8), // Khoảng cách giữa chữ và ô nhập liệu
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                          border: InputBorder.none, // Không có border
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Tìm kiếm"),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1.5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  const title =
                      'Nguyễn Hữu Kiên'; // Tên người dùng hoặc dữ liệu động khác
                  const subtitle =
                      '@nguyenhuukien'; // Dòng mô tả hoặc dữ liệu động khác

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          backgroundImage: AssetImage(
                              'assets/images/icon-tomiru-appbar.jpg'),
                        ),
                      ),
                      title: const Text(
                        title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        subtitle,
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: null,
                      onTap: () => _onListTileTap(
                          title), // Xử lý sự kiện khi nhấn vào ListTile
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
