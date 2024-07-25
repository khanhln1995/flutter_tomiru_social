import 'package:flutter/material.dart';

class QrTransactionResultScreen extends StatelessWidget {
  final String transactionCode;
  final String amount;
  final String validity;

  const QrTransactionResultScreen({
    super.key,
    required this.transactionCode,
    required this.amount,
    required this.validity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR giao dịch Tomxu',
            style: TextStyle(color: Colors.black)),
        backgroundColor: theme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Container(
        color: theme.primaryColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(18.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mã giao dịch: $transactionCode',
                            style: const TextStyle(color: Colors.black)),
                        Text('Số tiền: $amount Tomxu',
                            style: const TextStyle(color: Colors.black)),
                        Text('Hiệu lực: $validity',
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.qr_code, color: Colors.black),
                    onPressed: () {
                      // Implement QR code functionality
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/qr_1.png', // Replace with your QR code image asset path
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(height: 8.0),
                    Text(transactionCode,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    Text('$amount Tomxu',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0)),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.copy, color: Colors.black),
                        onPressed: () {
                          // Implement copy functionality
                        },
                      ),
                      const Text('Sao chép'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.download, color: Colors.black),
                        onPressed: () {
                          // Implement download functionality
                        },
                      ),
                      const Text('Tải về'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.black),
                        onPressed: () {
                          // Implement share functionality
                        },
                      ),
                      const Text('Chia sẻ'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
