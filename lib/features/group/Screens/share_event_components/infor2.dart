import 'package:flutter/material.dart';

class Infor2 extends StatefulWidget {
  final bool isAdmin;
  const Infor2({Key? key, required this.isAdmin}) : super(key: key);
  @override
  State<Infor2> createState() => _Infor2State();
}

class _Infor2State extends State<Infor2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Đảm bảo Column chỉ chiếm lượng không gian cần thiết
              children: [
                Row(
                  children: [
                    
                    Stack(
                      // Bọc Icon trong Stack
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                        ),
                        const Icon(Icons.person, size: 20, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(width: 8), // Khoảng cách giữa icon và text
                    const Text(
                      '1 người sẽ tham gia',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Stack(
                      // Bọc Icon trong Stack
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                        ),
                        const Icon(Icons.group, size: 20, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Nhóm - Thành viên của Tomiru',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
