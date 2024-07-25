import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/transaction_item_widget.dart';

class BuyPackageScreen extends StatelessWidget {
  const BuyPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dịch vụ/ Phí thành viên'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Gia hạn dịch vụ'),
              Tab(text: 'Mua mới'),
              Tab(text: 'Lịch sử'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildRenewServiceTab(theme),
            _buildNewPurchaseTab(),
            _buildHistoryTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildRenewServiceTab(ThemeData theme) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/logo-tomiru.jpg'),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mã thành viên: XTS12312',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Gói dịch vụ: Gói Premium Biz'),
                        Text('Thời gian hết hạn: 14:29 - 08/07/2024'),
                        Text('Còn lại: 20 ngày / 7 ngày'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: theme.primaryColor),
            title: const Text('Gói tiêu dùng'),
            subtitle: const Text('315d: 16h: 26m: 52s'),
            trailing: const Text('GÓI HIỆN TẠI'),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
              ),
              child: const Text(
                'Gia hạn ngay',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          _buildHistorySection(theme),
        ],
      ),
    );
  }

  Widget _buildNewPurchaseTab() {
    return const Center(child: Text('Mua mới'));
  }

  Widget _buildHistoryTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lịch sử gia hạn',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          _buildHistorySection(ThemeData.light()),
        ],
      ),
    );
  }

  Widget _buildHistorySection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            '09/07/2024 - Thứ Ba',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        const TransactionItemWidget(
          description: 'Gói Premium Biz',
          amount: '-660 Tomxu',
          status: 'Thành công',
          startTime: '14:00 - 08/06/2024',
          endTime: '14:00 - 08/07/2024',
          balanceAfter: '660 Tomxu',
          isPackage: true,
        ),
        const TransactionItemWidget(
          description: 'Chuyển Tomxu',
          amount: '-660 Tomxu',
          status: 'Thành công',
          startTime: '14:00 - 08/06/2024',
          endTime: '14:00 - 08/07/2024',
          balanceAfter: '660 Tomxu',
          isPackage: true,
        ),
        const TransactionItemWidget(
          description: 'Nhận Tomxu',
          amount: '+660 Tomxu',
          status: 'Thành công',
          startTime: '14:00 - 08/06/2024',
          endTime: '14:00 - 08/07/2024',
          balanceAfter: '660 Tomxu',
          isPackage: true,
        ),
        Container(
          color: Colors.grey.withOpacity(0.1),
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            '08/07/2024 - Thứ Hai',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        const TransactionItemWidget(
          description: 'Gói Premium Biz',
          amount: '-660 Tomxu',
          status: 'Thành công',
          startTime: '14:00 - 08/06/2024',
          endTime: '14:00 - 08/07/2024',
          balanceAfter: '660 Tomxu',
          isPackage: true,
        ),
      ],
    );
  }
}
