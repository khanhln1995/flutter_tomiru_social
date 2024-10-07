import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/camera/screen/qr_scanner_screen.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/dynamic_modal_widget.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/qr_transaction_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/transfer_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/buy_package_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/transactions_history_screen.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/withdrawal_screen.dart';

class ActionWallet extends StatelessWidget {
  const ActionWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              const SizedBox(width: 16.0), // Spacing between buttons
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
              const SizedBox(width: 16.0), // Spacing between buttons
              _buildActionButton('Withdraw', Images.walletLiquidity, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WithdrawalScreen(),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      String label, String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, width: 30.0, height: 30.0),
            const SizedBox(height: 8.0),
            Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14.0)),
          ],
        ),
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
              // Handle navigateToQrScanner
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
