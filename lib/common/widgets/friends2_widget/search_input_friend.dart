import 'package:flutter/material.dart';

class SearchInputFriend extends StatefulWidget {
  const SearchInputFriend({Key? key}) : super(key: key);

  @override
  _SearchInputFriendState createState() => _SearchInputFriendState();
}

class _SearchInputFriendState extends State<SearchInputFriend> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double height = constraints.maxHeight;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: IconButton(
                // Thêm nút IconButton cho icon back
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  // Xử lý sự kiện khi nhấn nút "back"
                  Navigator.of(context)
                      .pop(); // Ví dụ: Quay lại màn hình trước đó
                },
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.9, // Chiều rộng 90% màn hình
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.055,
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 128, 126, 126),
                      ),
                      hintText: "Nhập tên bạn bè",
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 128, 126, 126),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Độ bo tròn ở góc
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 245, 244, 244),
                    ),
                  ),
                ),
              ),
            ),
           const SizedBox(width: 10.0),
          ],
        ),
      );
    });
  }
}
