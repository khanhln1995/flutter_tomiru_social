import 'package:flutter/material.dart';

class SettingNotifyDialog extends StatefulWidget {
  @override
  _SettingNotifyDialogState createState() => _SettingNotifyDialogState();
}

class _SettingNotifyDialogState extends State<SettingNotifyDialog> {
  // Danh sách trạng thái của các toggle button
  List<bool> _selections = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final buttonWidth =
              constraints.maxWidth / 2.3; // Chiều rộng của mỗi nút

          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.settings, size: 24),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'Cài đặt thông báo',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 24),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextWithToggleButton(0, 'Nhận thông báo TOMXU',
                            Icons.attach_money_sharp),
                        SizedBox(height: 8.0),
                        _buildTextWithToggleButton(
                            1,
                            'Nhận thông báo tài khoản',
                            Icons.account_circle_outlined),
                        SizedBox(height: 8.0),
                        _buildTextWithToggleButton(
                            2,
                            'Nhận thông báo tương tác',
                            Icons.chat_bubble_outline),
                        Spacer(), // Đẩy các nút xuống dưới
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: buttonWidth, // Chiều rộng của nút Cancel
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Đóng dialog
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          child: Text('Hủy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        width: buttonWidth, // Chiều rộng của nút Confirm
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Đóng dialog
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            side: BorderSide(color: Colors.blue, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          child: Text('Lưu', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextWithToggleButton(int index, String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 22),
        SizedBox(width: 10.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(width: 8.0),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: IconButton(
            key: ValueKey<bool>(_selections[index]),
            icon: Icon(
              _selections[index] ? Icons.toggle_on : Icons.toggle_off,
              color: _selections[index] ? Colors.blue : Colors.grey,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                _selections[index] = !_selections[index];
              });
            },
          ),
        ),
      ],
    );
  }
}
