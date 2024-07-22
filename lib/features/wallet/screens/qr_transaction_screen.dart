import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/qr_common_tab.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/qr_transaction_tab.dart';

import 'qr_transaction_result_screen.dart'; // Import the new result screen

class QrTransactionScreen extends StatefulWidget {
  const QrTransactionScreen({super.key});

  @override
  _QrTransactionScreenState createState() => _QrTransactionScreenState();
}

class _QrTransactionScreenState extends State<QrTransactionScreen> {
  String _selectedTime = '10 phút';

  void _selectTime(String time) {
    setState(() {
      _selectedTime = time;
    });
  }

  void _createQrTransaction() {
    // Navigate to the result screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QrTransactionResultScreen(
          transactionCode: 'XYZ123',
          amount: '2.200',
          validity: _selectedTime,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
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
                    QrTransactionTab(
                      selectedTime: _selectedTime,
                      selectTime: _selectTime,
                      createQrTransaction: _createQrTransaction,
                    ),
                    const QrCommonTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
