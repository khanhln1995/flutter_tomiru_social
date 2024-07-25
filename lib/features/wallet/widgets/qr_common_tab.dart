import 'package:flutter/material.dart';

class QrCommonTab extends StatelessWidget {
  const QrCommonTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: SingleChildScrollView(
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
                  const Text(
                    'nature.vietnam1@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.black),
                    onPressed: () {
                      // Implement copy functionality
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Đưa mã này cho người chuyển để nhận Tomxu',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/qr_1.png', // Replace with your QR code image asset path
                          width: 250,
                          height: 250,
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Nguyễn Văn Hậu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.copy,
                                      color: Colors.black),
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
                                  icon: const Icon(Icons.download,
                                      color: Colors.black),
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
                                  icon: const Icon(Icons.share,
                                      color: Colors.black),
                                  onPressed: () {
                                    // Implement share functionality
                                  },
                                ),
                                const Text('Chia sẻ'),
                              ],
                            ),
                          ],
                        ),
                      ],
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
}
