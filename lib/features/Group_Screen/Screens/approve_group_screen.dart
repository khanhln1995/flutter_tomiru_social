import 'package:flutter/material.dart';

// Định nghĩa lớp StatefulWidget cho màn hình duyệt nhóm
class ApproveGroupScreen extends StatefulWidget {
  const ApproveGroupScreen({super.key});

  @override
  State<ApproveGroupScreen> createState() => _ApproveGroupScreenState();
}

class _ApproveGroupScreenState extends State<ApproveGroupScreen> {
  // Tạo danh sách các yêu cầu duyệt, với 4 yêu cầu giống nhau
  final List<Map<String, String>>   requests = List.generate(
    4,
    (index) => {
      "name": "Nguyễn Thu Huyền",
      "time": "1 phút trước",
      "image": "assets/images/Ellipse 11.png",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar của màn hình
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cần xét duyệt',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // Màu nền của màn hình chính
      backgroundColor: Colors.grey[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding chứa phần tiêu đề "Kiểm duyệt" và số lượng yêu cầu
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 25, 19, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kiểm duyệt',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '(4 yêu cầu)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Padding chứa TextField để tìm kiếm nhóm
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm nhóm',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Sử dụng Expanded để ListView.builder chiếm phần còn lại của màn hình
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];
                return Column(
                  children: [
                    // ListTile hiển thị thông tin của từng yêu cầu
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(request["image"]!),
                      title: Text(
                        request["name"]!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        request["time"]!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    // Hàng các nút bấm "Phê duyệt", "Từ chối" và biểu tượng chat
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                side: BorderSide.none,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Phê duyệt',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 11),
                        Expanded(
                          child: SizedBox(
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                side: BorderSide.none,
                                backgroundColor: Colors.grey[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Từ chối',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 11),
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              side: BorderSide.none,
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/Chat1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
