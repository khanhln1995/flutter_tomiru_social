import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/transaction_item_widget.dart';

class TransactionsHistoryScreen extends StatelessWidget {
  const TransactionsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử giao dịch',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransactionDateHeader('09/07/2024 - Thứ Ba', theme),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            const TransactionItemWidget(
              description: 'Chuyển Tomxu',
              startTime: '14:00 - 08/06/2024',
              endTime: '',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: false,
            ),
            const TransactionItemWidget(
              description: 'Nhận Tomxu',
              startTime: '14:00 - 08/06/2024',
              endTime: '',
              amount: '+660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: false,
            ),
            _buildTransactionDateHeader('08/07/2024 - Thứ Hai', theme),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            _buildTransactionDateHeader('07/07/2024 - Chủ Nhật', theme),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            _buildTransactionDateHeader('06/07/2024 - Thứ Bảy', theme),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
            const TransactionItemWidget(
              description: 'Gói Premium Biz',
              startTime: '14:00 - 08/06/2024',
              endTime: '14:00 - 08/07/2024',
              amount: '-660 Tomxu',
              status: 'Thành công',
              balanceAfter: '660 Tomxu',
              isPackage: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionDateHeader(String date, ThemeData theme) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        date,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
