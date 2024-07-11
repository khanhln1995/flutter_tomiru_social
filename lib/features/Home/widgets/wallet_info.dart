import 'package:flutter/material.dart';

class WalletInfo extends StatefulWidget {
  const WalletInfo({super.key});

  @override
  State<WalletInfo> createState() => _WalletInfoState();
}

class _WalletInfoState extends State<WalletInfo> {
  Widget _iconButton(IconData icon, String label1, String label2, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(label1,
            style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
        Text(label2,
            style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tomxu', style: TextStyle(fontSize: 16)),
                  Text('34.553',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PTomxu', style: TextStyle(fontSize: 16)),
                  Text('77.4',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconButton(Icons.swap_horiz, 'Chuyển', 'Tomxu', Colors.blue),
              _iconButton(Icons.call_received, 'Nhận', 'Tomxu', Colors.green),
              _iconButton(Icons.history, 'Lịch sử', 'giao dịch', Colors.orange),
              _iconButton(Icons.sync, 'Trao đổi', 'Tomxu', Colors.purple),
            ],
          ),
        ],
      ),
    );
  }
}
