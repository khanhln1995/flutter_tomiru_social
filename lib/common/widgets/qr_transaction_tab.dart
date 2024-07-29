import 'package:flutter/material.dart';

class QrTransactionTab extends StatefulWidget {
  final String selectedTime;
  final void Function(String) selectTime;
  final VoidCallback createQrTransaction;

  const QrTransactionTab({
    super.key,
    required this.selectedTime,
    required this.selectTime,
    required this.createQrTransaction,
  });

  @override
  _QrTransactionTabState createState() => _QrTransactionTabState();
}

class _QrTransactionTabState extends State<QrTransactionTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thông tin giao dịch',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Tạo mã QR giao dịch theo từng giao dịch với số tiền',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Số Tomxu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const SizedBox(
                    height: 50,
                    child: TextField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Thời gian hiệu lực',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTimeButton(context, '10 phút', theme.primaryColor,
                          widget.selectedTime == '10 phút'),
                      _buildTimeButton(context, '60 phút', theme.primaryColor,
                          widget.selectedTime == '60 phút'),
                      _buildTimeButton(context, '24 giờ', theme.primaryColor,
                          widget.selectedTime == '24 giờ'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Ghi chú',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    minLines: 3,
                    maxLines: 5,
                    cursorColor: theme.primaryColor,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Phí GD: 0 TOMXU',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: widget.createQrTransaction,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text(
                        'Tạo mã QR giao dịch',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButton(
      BuildContext context, String label, Color color, bool isSelected) {
    return ElevatedButton(
      onPressed: () => widget.selectTime(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? color : Colors.white,
        foregroundColor: isSelected ? Colors.white : color,
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(label,
          style: TextStyle(color: isSelected ? Colors.white : color)),
    );
  }
}
