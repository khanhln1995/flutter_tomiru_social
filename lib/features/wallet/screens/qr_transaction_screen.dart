import 'package:flutter/material.dart';

class QrTransactionScreen extends StatefulWidget {
  final int initialTabIndex;

  const QrTransactionScreen({super.key, this.initialTabIndex = 0});

  @override
  _QrTransactionScreenState createState() => _QrTransactionScreenState();
}

class _QrTransactionScreenState extends State<QrTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialTabIndex,
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('Nhận Tomxu', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.grey,
              height: 1.0,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  tabs: const [
                    Tab(text: 'Mã QR giao dịch'),
                    Tab(text: 'Mã QR chung'),
                  ],
                  indicatorColor: theme.primaryColor,
                  labelColor: theme.primaryColor,
                  unselectedLabelColor: theme.unselectedWidgetColor,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      return states.contains(WidgetState.focused)
                          ? null
                          : Colors.transparent;
                    },
                  ),
                  dividerColor: theme.unselectedWidgetColor,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildQrTransactionTab(context, theme),
                    _buildQrCommonTab(context, theme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrTransactionTab(BuildContext context, ThemeData theme) {
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
                      _buildTimeButton(
                          context, '10 phút', theme.primaryColor, '10 phút'),
                      _buildTimeButton(
                          context, '60 phút', theme.primaryColor, '60 phút'),
                      _buildTimeButton(
                          context, '24 giờ', theme.primaryColor, '24 giờ'),
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
                      onPressed: () {},
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

  Widget _buildQrCommonTab(BuildContext context, ThemeData theme) {
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

  Widget _buildTimeButton(
      BuildContext context, String label, Color color, String selectedTime) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          // Update the selected time logic
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: label == selectedTime ? color : Colors.white,
        foregroundColor: label == selectedTime ? Colors.white : color,
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(label,
          style:
              TextStyle(color: label == selectedTime ? Colors.white : color)),
    );
  }
}
