import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/create_withdrawal_widget.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/withdrawal_history_widget.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('Withdrawal', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Create Transaction'),
              Tab(text: 'History'),
            ],
            indicatorColor: theme.primaryColor,
            labelColor: theme.primaryColor,
            unselectedLabelColor: theme.unselectedWidgetColor,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              CreateWithdrawalWidget(), // Use the new widget
              WithdrawalHistoryWidget(), // Use the new widget
            ],
          ),
        ),
      ),
    );
  }
}
