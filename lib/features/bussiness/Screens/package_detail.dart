import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tomiru_social_flutter/features/bussiness/Screens/membership_package.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/features/users_profile/controller/users_profile_controller.dart';
import 'package:tomiru_social_flutter/features/users_profile/domain/models/users_me.dart';
import 'package:tomiru_social_flutter/features/wallet/widgets/transaction_item_widget.dart';
import 'dart:async';

class PackageDetail extends StatefulWidget {
  const PackageDetail({super.key});

  @override
  _PackageDetailState createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  late Timer timer;
  late Duration remainingDuration;
  late String formattedRemainingTimeInDetail;
  late String formattedRemainingTime;

  @override
  void initState() {
    super.initState();
    final UsersProfileController controller =
        Get.find<UsersProfileController>();
    controller.getCurrentUsersLocal();
    UserProfile? userProfile = controller.userProfile;

    int expiredPremiumAt = userProfile!.expiredPremiumAt;
    DateTime expiredPremiumDateTime =
        DateTime.fromMillisecondsSinceEpoch(expiredPremiumAt);
    remainingDuration = expiredPremiumDateTime.difference(DateTime.now());
    formattedRemainingTimeInDetail = _formatDuration(remainingDuration);

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        remainingDuration = remainingDuration - const Duration(seconds: 1);
        formattedRemainingTimeInDetail = _formatDuration(remainingDuration);
        if (remainingDuration.isNegative) {
          timer.cancel();
        }
      });
    });
    fetchWalletInfo();
  }

// lấy thông tin ví
  List<WalletInfo> incomeList = [];
  Map<String, String> filters = {'filters[type]': 'buy_package', 'limit': '3'};
  Future<void> fetchWalletInfo() async {
    List<WalletInfo> income = await Get.find<BusinessController>()
        .getWalletInfoByFilter(filters: filters);
    // print("Đây là package detail");
    // print(income.map((index) => index.toJson()).toList());
    setState(() {
      incomeList = income;
    });
  }

  //
  String _formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours.remainder(24);
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return '$days ngày $hours giờ $minutes phút $seconds giây';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final UsersProfileController controller =
        Get.find<UsersProfileController>();
    UserProfile? userProfile = controller.userProfile;

    int buyPackageAt = userProfile!.buyPackageAt;
    DateTime buyPackageDateTime =
        DateTime.fromMillisecondsSinceEpoch(buyPackageAt);
    DateTime expiredPremiumDateTime =
        DateTime.fromMillisecondsSinceEpoch(userProfile.expiredPremiumAt);
    String formattedBuyPackageDateTime =
        DateFormat('HH:mm:ss  dd/MM/yyyy').format(buyPackageDateTime);
    String formattedExpiredPremiumDateTime =
        DateFormat('HH:mm:ss  dd/MM/yyyy').format(expiredPremiumDateTime);
    Duration remainingTime = expiredPremiumDateTime.difference(DateTime.now());
    if (remainingTime.inDays > 365) {
      int years = remainingTime.inDays ~/ 365;
      int days = remainingTime.inDays.remainder(365);
      formattedRemainingTime = '$years năm $days ngày';
    } else {
      formattedRemainingTime = '${remainingTime.inDays} ngày';
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            _buildRenewServiceTab(
                theme, context, userProfile, formattedExpiredPremiumDateTime),
            _buildNewPurchaseTab(),
            _buildHistoryTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildRenewServiceTab(ThemeData theme, BuildContext context,
      UserProfile userProfile, String formattedExpiredPremiumDateTime) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/logo-tomiru.jpg'),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mã thành viên: ${userProfile.refCode}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('Gói dịch vụ: Gói Premium'),
                        Text(
                            'Thời gian hết hạn: $formattedExpiredPremiumDateTime'),
                        Text('Còn lại: $formattedRemainingTime'),
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
            subtitle: Text(formattedRemainingTimeInDetail),
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MembershipPackage()));
                },
                child: const Text(
                  'Gia hạn ngay',
                  style: TextStyle(color: Colors.white),
                ),
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
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: incomeList.length,
      itemBuilder: (context, index) {
        int preBalance = incomeList[index].preBalance;
        int postBalance = incomeList[index].postBalance;

        String valuePrefix = postBalance >= preBalance ? "+" : "-";
        DateTime createdAtDateTime =
            DateTime.fromMillisecondsSinceEpoch(incomeList[index].createdAt);

        String formattedDate =
            DateFormat('dd/MM/yyyy').format(createdAtDateTime);
        String formattedTime = DateFormat('HH:mm:ss').format(createdAtDateTime);
        return Column(
          children: [
            ListTile(
              title: Text(incomeList[index].message),
              subtitle: Text('$formattedDate - $formattedTime'),
              trailing: Column(
                children: [
                  Text("$valuePrefix ${incomeList[index].value}"),
                  Text(
                    ' ${incomeList[index].status}',
                    style: TextStyle(
                      color: incomeList[index].status == 'failed'
                          ? Colors.red
                          : Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
