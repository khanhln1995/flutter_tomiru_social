import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/camera/screen/qr_scanner_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/qr_transaction_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/transactions_history_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/withdrawal_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/transfer_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/buy_package_screen.dart'; // Import BuyPackageScreen
import 'package:tomiru_social_flutter/util/images.dart';
import 'dynamic_modal_widget.dart';

class BalanceTabWidget extends StatelessWidget {
  const BalanceTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Images.walletBackgroundScreen,
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TabBar(
                      tabs: const [
                        Tab(text: 'TOMXU'),
                        Tab(text: 'P. Tomxu'),
                      ],
                      indicatorColor: theme.primaryColor,
                      labelColor: theme.primaryColor,
                      unselectedLabelColor: theme.unselectedWidgetColor,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 100,
                      child: TabBarView(
                        children: [
                          _buildTomxuContent(theme),
                          _buildPTomxuContent(theme),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildActionButton('Receive', Images.walletReceive, () {
                    _showDynamicModal(
                      context,
                      'Nhận Tomxu (Giao dịch tức thời 24/7)',
                      [
                        {
                          'title': 'Mã QR nhận tiền theo giao dịch',
                          'description': 'Nhận thanh toán với số tiền',
                          'onTap': 'navigateToQrTransaction',
                        },
                        {
                          'title': 'Mã QR nhận tiền',
                          'description':
                              'Gửi mã QR cho người chuyển tiền để nhận Tomxu ngay tức thì',
                          'onTap': 'navigateToQrCommon',
                        },
                      ],
                      Icons.qr_code,
                    );
                  }),
                  _buildActionButton('Transfer', Images.walletTransfer, () {
                    _showDynamicModal(
                      context,
                      'Chuyển Tomxu (miễn phí 24/7)',
                      [
                        {
                          'title': 'Chuyển Tomxu bằng QR',
                          'description':
                              'Chuyển khoản số dư Tomiru trong hệ thống\nApp ngay tức thì',
                          'onTap': 'navigateToQrScanner',
                        },
                        {
                          'title': 'Tới người nhận mới',
                          'description':
                              'Chuyển khoản số dư Tomiru trong hệ thống\nApp ngay tức thì',
                          'onTap': 'navigateToTransferScreen',
                        },
                        {
                          'title': 'Tới danh sách đã lưu',
                          'description':
                              'Chuyển khoản số dư Tomiru trong hệ thống\nApp ngay tức thì',
                          'onTap': 'navigateToSavedContacts',
                        },
                        {
                          'title': 'Dịch vụ/ Phí thành viên',
                          'description':
                              'Chuyển khoản số dư Tomiru trong hệ thống\nApp ngay tức thì',
                          'onTap': 'navigateToBuyPackageScreen',
                        },
                      ],
                      Icons.qr_code,
                    );
                  }),
                  _buildActionButton('Withdraw', Images.walletLiquidity, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WithdrawalScreen(),
                      ),
                    );
                  }),
                  _buildActionButton(
                      'Transaction History', Images.walletHistory, () {
                    Get.to(() => const TransactionsHistoryScreen());
                  }),
                  _buildActionButton(
                      'Pending Requests', Images.walletWaitingRequest, () {}),
                  _buildActionButton(
                      'Exchange Tomxu', Images.walletExchange, () {}),
                ],
              ),
              ListTile(
                title: const Text('About Tomxu'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTomxuContent(ThemeData theme) {
    return Column(
      children: [
        Text(
          '34.553 Tomxu',
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Available: ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '6,700,000 đ',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RichText(
                textAlign: TextAlign.end,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Frozen: ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '0 Tomxu',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPTomxuContent(ThemeData theme) {
    return Column(
      children: [
        Text(
          '77.4 Tomxu',
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Available: ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '6,700,000 đ',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RichText(
                textAlign: TextAlign.end,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Frozen: ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '0 Tomxu',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
      String label, String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(imagePath, width: 40.0, height: 40.0),
          ),
          const SizedBox(height: 8.0),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  void _showDynamicModal(BuildContext context, String title,
      List<Map<String, String>> options, IconData icon) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        final List<Map<String, String>> allOptions = [
          ...options,
        ];
        return DynamicModalWidget(
          title: title,
          options: allOptions,
          icon: icon,
          onOptionTap: (option) {
            if (option['onTap'] == 'navigateToQrTransaction') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const QrTransactionScreen(initialTabIndex: 0),
                ),
              );
            } else if (option['onTap'] == 'navigateToQrCommon') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const QrTransactionScreen(initialTabIndex: 1),
                ),
              );
            } else if (option['onTap'] == 'navigateToQrScanner') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QrScannerScreen(),
                ),
              );
            } else if (option['onTap'] == 'navigateToTransferScreen') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                       TransferScreen(initialTabIndex: 0),
                ),
              );
            } else if (option['onTap'] == 'navigateToSavedContacts') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TransferScreen(initialTabIndex: 1),
                ),
              );
            } else if (option['onTap'] == 'navigateToBuyPackageScreen') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BuyPackageScreen(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
