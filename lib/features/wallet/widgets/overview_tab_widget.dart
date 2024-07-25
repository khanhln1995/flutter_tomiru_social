import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/transactions_history_screen.dart';
import 'package:tomiru_social_flutter/util/images.dart';
import 'transaction_item_widget.dart';

class OverviewTabWidget extends StatelessWidget {
  const OverviewTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                      Images.guest), // Replace with user avatar image path
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tổng Tomxu đã nạp: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: '34343',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tổng đã Chuyển: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: '34343',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tổng đã Nhận: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: '99934',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hình thức xác thực: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextSpan(
                              text: 'OTP by SMS',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Giao dịch gần đây',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const TransactionsHistoryScreen());
                    },
                    child: Text('Xem tất cả',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          _buildTransactionSection(
            context,
            date: '09/07/2024 - Thứ Ba',
            transactions: [
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
                endTime: '',
                balanceAfter: '660 Tomxu',
                isPackage: false,
              ),
              const TransactionItemWidget(
                description: 'Nhận Tomxu',
                amount: '+660 Tomxu',
                status: 'Thành công',
                startTime: '14:00 - 08/06/2024',
                endTime: '',
                balanceAfter: '660 Tomxu',
                isPackage: false,
              ),
            ],
          ),
          _buildTransactionSection(
            context,
            date: '08/07/2024 - Thứ Hai',
            transactions: [
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
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionSection(BuildContext context,
      {required String date,
      required List<TransactionItemWidget> transactions}) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          ...transactions,
        ],
      ),
    );
  }
}
