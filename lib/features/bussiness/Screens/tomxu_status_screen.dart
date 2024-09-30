import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/helper/route_helper.dart';

class TomxuStatusScreen extends StatelessWidget {
  final bool isSuccess;
  final int? tomxuAmount;
  final DateTime? expirationDate;

  const TomxuStatusScreen({
    super.key,
    required this.isSuccess,
    this.tomxuAmount,
    this.expirationDate,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 42, 25, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                _buildStatusIcon(),
                const SizedBox(height: 20),
                _buildStatusText(),
                if (isSuccess) ...[
                  const SizedBox(height: 20),
                  // _buildTomxuInfo(),
                ] else ...[
                  const SizedBox(height: 10),
                  _buildContactInfo(),
                ],
                const Spacer(),
                _buildHomeButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      child: Icon(
        isSuccess ? Icons.check : Icons.close,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  Widget _buildStatusText() {
    return Text(
      isSuccess ? 'Giao dịch thành công!' : 'Giao dịch thất bại!',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTomxuInfo() {
    return Column(
      children: [
        _buildInfoRow('Gói Premium Biz', 'Thành công'),
        _buildInfoRow('Trước GD', '1200 Tomxu'),
        _buildInfoRow('Sau GD', '${tomxuAmount ?? 660} Tomxu'),
        _buildInfoRow(
          'Ngày gia hạn',
          '14:00 - ${expirationDate?.day ?? 8}/${expirationDate?.month ?? 7}/2024',
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
          Text(value,
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return const Text(
      'Để được hỗ trợ thêm bạn vui lòng gọi Tomiru qua 19006771 hoặc hotro@tomiru.com',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _buildHomeButton(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.offNamedUntil(RouteHelper.getBusinessRoute(), (route) => route.settings.name == RouteHelper.getInitialRoute());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: const Center(
          child: Text(
            'Về trang chủ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
