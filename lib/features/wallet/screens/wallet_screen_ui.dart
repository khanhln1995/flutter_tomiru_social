import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/users_profile/controller/users_profile_controller.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/balance_tab_widget.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/overview_tab_widget.dart';
import 'package:tomiru_social_flutter/util/images.dart';

import 'package:tomiru_social_flutter/features/wallet/controllers/wallet_controller.dart';
import '../domain/models/wallet_history_model.dart';
import '../controllers/wallet_controller.dart';

class WalletScreenUi extends StatefulWidget {
  const WalletScreenUi({super.key});

  @override
  _WalletScreenUiState createState() => _WalletScreenUiState();
}

class _WalletScreenUiState extends State<WalletScreenUi>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<WalletHistoryModel> wallet = [];

  @override
  void initState() {
    super.initState();

    wallet = Get.find<WalletController>().walletHistory;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví Tomxu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: theme.primaryColor),
        actions: [
          IconButton(icon: const Icon(Icons.qr_code), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey, // Border color
            height: 1.0,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  text: '          Sổ dư          ',
                ),
                Tab(text: '          Tổng quan          '),
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  BalanceTabWidget(),
                  OverviewTabWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
