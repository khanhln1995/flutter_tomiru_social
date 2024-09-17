import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:tomiru_social_flutter/util/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_loader_widget.dart';

class FundScreen extends StatefulWidget {
  const FundScreen({super.key});

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  List<VaultInfo> vaultList = [];

  @override
  void initState() {
    super.initState();
    fetchVaultInfo();
  }

  Future<void> fetchVaultInfo() async {
    List<VaultInfo> vaults =
        await Get.find<BusinessController>().getVaultInfo();
    setState(() {
      vaultList = vaults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: vaultList.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: vaultList.length,
                  itemBuilder: (context, index) {
                    return FundCard(
                        name: vaultList[index].name.replaceAll("Vault", "Quỹ"),
                        avatar: vaultList[index].icon.replaceAll(
                            'localhost:8080',
                            AppConstants.baseUrl.substring(7)),
                        unit: vaultList[index].unit,
                        value: vaultList[index].value,
                        timeLeft: '03d : 12h : 24m : 60s',
                        total: vaultList[index].total);
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)))),
    );
  }
}

class FundCard extends StatelessWidget {
  final String avatar;
  final String name;
  final int total;
  final String unit;
  final double value;
  final String timeLeft;

  const FundCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.total,
    required this.unit,
    required this.value,
    required this.timeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SvgPicture.network(avatar),
                const SizedBox(height: 8),
                Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  unit,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.info_outline, size: 18),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('$total thành viên hợp lệ sẽ được nhận thưởng'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 4),
                      Text(timeLeft),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
