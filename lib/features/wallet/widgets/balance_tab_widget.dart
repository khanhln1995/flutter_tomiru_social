import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/util/images.dart';

class BalanceTabWidget extends StatelessWidget {
  const BalanceTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Images
                .walletBackgroundScreen, // Replace with your background image path
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
                  _buildActionButton('Nhận', Images.walletReceive),
                  _buildActionButton('Chuyển', Images.walletTransfer),
                  _buildActionButton('Thanh khoản', Images.walletLiquidity),
                  _buildActionButton(
                      'Lịch sử\nGiao dịch', Images.walletHistory),
                  _buildActionButton(
                      'Chờ\nxác nhận', Images.walletWaitingRequest),
                  _buildActionButton('Trao đổi\nTomxu', Images.walletExchange),
                ],
              ),
              ListTile(
                title: const Text('Giới thiệu về Tomxu'),
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
                      text: 'Khả dụng: ',
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
                      text: 'Đóng băng: ',
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
                      text: 'Khả dụng: ',
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
                      text: 'Đóng băng: ',
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

  Widget _buildActionButton(String label, String imagePath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(imagePath, width: 40.0, height: 40.0),
        ),
        const SizedBox(height: 8.0),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}