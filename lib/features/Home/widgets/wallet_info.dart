import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/users_profile/domain/models/users_me.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/wallet_screen_ui.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';
import '../../users_profile/controller/users_profile_controller.dart';
import "action_wallet.dart";
import 'package:intl/intl.dart';

class WalletInfo extends StatelessWidget {
  const WalletInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersProfileController>(
      init: Get.find<UsersProfileController>(),
      builder: (controller) {
        controller.getUsersBalancesLocal();
        if (controller.userBalance!.isEmpty) {
          return const Center(child: CircularProgressIndicator());
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
                      const Text('Tomxu', style: TextStyle(fontSize: 16)),
                      Text(
                        controller.userBalance!.length > 0
                            ? formatBalance(controller.userBalance![0].balance)
                            : 'N/A',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('PTomxu', style: TextStyle(fontSize: 16)),
                      Text(
                        controller.userBalance!.length > 1
                            ? formatBalance(controller.userBalance![1].balance)
                            : 'N/A',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const ActionWallet(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getWalletRoute());
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
      },
    );
  }

  String formatBalance(String balance) {
    // Convert the balance string to a double
    double balanceDouble = double.tryParse(balance) ?? 0.0;

    // Format the double to one decimal place
    return NumberFormat('0.0', 'en_US').format(balanceDouble);
  }
}
