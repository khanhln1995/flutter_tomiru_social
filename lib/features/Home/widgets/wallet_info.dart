import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/wallet_screen_ui.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import '../../users_profile/controller/users_profile_controller.dart';
import 'package:tomiru_social_flutter/features/wallet/controllers/wallet_controller.dart';
import "action_wallet.dart";
import "package:tomiru_social_flutter/features/users_profile/domain/models/users_me.dart";
import 'package:intl/intl.dart';

class WalletInfo extends StatefulWidget {
  final List<UserBalance> userBalanceList;
    WalletInfo({Key? key, required this.userBalanceList}) : super(key: key);

  @override
  State<WalletInfo> createState() => _WalletInfoState();
}

class _WalletInfoState extends State<WalletInfo> {
  Widget _iconButton(IconData icon, String label1, String label2, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label1,
            style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
        Text(label2,
            style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }
  String formatBalance(String balance) {
    // Convert the balance string to a double
    double balanceDouble = double.tryParse(balance) ?? 0.0;

    // Format the double to one decimal place
    return NumberFormat('0.0', 'en_US').format(balanceDouble);
  }
  @override
  Widget build(BuildContext context) {
      if (widget.userBalanceList.isEmpty) {
      return Center(child: Text('No balances available'));
    }
   
   
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tomxu', style: TextStyle(fontSize: 16)),
                 Text(
                    widget.userBalanceList.length > 1
                        ? formatBalance(widget.userBalanceList[0].balance)
                        : 'N/A',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PTomxu', style: TextStyle(fontSize: 16)),
                   Text(
                    widget.userBalanceList.length > 1
                        ? formatBalance(widget.userBalanceList[1].balance)
                        : 'N/A',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     _iconButton(Icons.swap_horiz, 'Chuyển', 'Tomxu', Colors.blue),
          //     _iconButton(Icons.call_received, 'Nhận', 'Tomxu', Colors.green),
          //     _iconButton(Icons.history, 'Lịch sử', 'giao dịch', Colors.orange),
          //     _iconButton(Icons.sync, 'Trao đổi', 'Tomxu', Colors.purple),
          //   ],
          // ),
          const ActionWallet(),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, RouteHelper.getWalletRoute());
              Get.toNamed(RouteHelper.getWalletRoute());
              //test
              // Get.find<UsersWalletController>().sendToken();
              // Get.find<UsersProfileController>().setCurrentUsers();
              // Get.find<UsersProfileController>().getUsersBalancesLocal();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Xem thêm'),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
