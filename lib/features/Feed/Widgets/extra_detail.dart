import 'package:flutter/material.dart';

class ExtraDetail extends StatefulWidget {
  const ExtraDetail({Key? key}) : super(key: key);

  @override
  State<ExtraDetail> createState() => _ExtraDetailState();
}

class _ExtraDetailState extends State<ExtraDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    scanQRHandler();
                  },
                  child: Image.asset(
                    'assets/images/icon-scan.jpg',
                    height: 35,
                  ),
                ),
                Text(
                  'Quét QR',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                walletHandler();
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wallet,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Ví Tomxu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    'Giảm giá 60.000đ - Kích hoạt ví',
                    style: TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                checkInDailyHandler();
              },
              child: Image.asset(
                'assets/images/checkindaily.png',
                height: 70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void scanQRHandler() {}
  void walletHandler() {}
  void checkInDailyHandler() {}
}
