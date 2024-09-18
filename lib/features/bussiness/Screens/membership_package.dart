import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tomiru_social_flutter/features/bussiness/Screens/service_register.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/packages.dart';

class MembershipPackage extends StatelessWidget {
  MembershipPackage({super.key});

  final List<String> listPremiumNames = [
    'Consumer',
    'Business',
    'Business Extend'
  ];

  final Map<String, PremiumPackageStyles> listPremiumStyles = {
    'Consumer': PremiumPackageStyles(
      backgroundColor: Colors.grey[900]!,
      border: Border.all(color: Colors.black, width: 2.0),
      buttonStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      listDetails: [
        'Được mua hàng tại các Đại lý, điểm bán Tomiru chiết khấu: 10 - 20% trên tất cả các sản phẩm',
        'Được điểm danh, đủ điều kiện tích điểm sang năm thứ 2 mở thẻ miễn phí (miễn phí trọn đời)',
        'Được quyền giới thiệu thẻ đóng phí theo năm và hưởng 20% hoa hồng trực tiếp trên 1.320.000 đồng = 264.000 đồng/ thẻ',
      ],
    ),
    'Business': PremiumPackageStyles(
      backgroundColor: const Color(0xFFDAA520), // Gold color
      border: Border.all(color: Colors.black, width: 2.0),
      buttonStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      listDetails: [
        'Được nhận Combo hàng từ 1.7 triệu đến 2.1 triệu',
        'Được mua hàng tại Đại lý, điểm bán Tomiru chiết khấu 10 - 28% tất cả sản phẩm',
        'Được sở hữu vị trí cố định tại mô hình hoàn phí của Doanh nghiệp',
        'Cơ hội có nguồn thu nhập khi giới thiệu đủ 3 Khách hàng có nhu cầu kinh doanh.',
      ],
    ),
    'Business Extend': PremiumPackageStyles(
      backgroundColor: const Color(0xFFDAA520), // Gold color
      border: Border.all(color: Colors.black, width: 2.0),
      buttonStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      listDetails: [
        'Được nhận Combo hàng từ 1.7 triệu đến 2.1 triệu',
        'Được mua hàng tại Đại lý, điểm bán Tomiru chiết khấu 10 - 28% tất cả sản phẩm',
        'Được sở hữu vị trí cố định tại mô hình hoàn phí của Doanh nghiệp',
        'Cơ hội có nguồn thu nhập khi giới thiệu đủ 3 Khách hàng có nhu cầu kinh doanh.',
      ],
    ),
  };

  String _getPeriod(int validInDay) {
    if (validInDay == 7) {
      return '/ tuần';
    } else if (validInDay == 30) {
      return '/ tháng';
    } else if (validInDay == 365) {
      return '/ năm';
    } else {
      return ''; // Default or for other periods not covered
    }
  }

  void _showBottomSheet(BuildContext context, String title, String details,
      String price, String period, double vat) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14.94,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'TIẾT KIỆM 10%',
                        style: TextStyle(
                          fontSize: 10.86,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                          text: price,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 32.67),
                          children: [
                            TextSpan(
                              text: period,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 21.19),
                            ),
                            const WidgetSpan(
                              child: SizedBox(width: 10),
                            ),
                            TextSpan(
                              text: "(Đã gồm ${(vat * 100).toInt()}% VAT)",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 11.19),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  details,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => ServiceRegisterForm(
                        packageName: title,
                        price: price,
                        period: period,
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Center(
                  child: Text(
                    title != "Business Extend"
                        ? 'Đăng ký và thanh toán'
                        : 'Gia hạn',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FutureBuilder<Packages>(
          future: Get.find<BusinessController>().getPackages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final packages = snapshot.data?.packages ?? [];
              final vat = snapshot.data!.vat;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Chọn gói thành viên phù hợp với bạn',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...packages.map((package) {
                      final packageName = package.name;

                      if (listPremiumNames.contains(packageName)) {
                        final packageStyle = listPremiumStyles[packageName];
                        final period = _getPeriod(package.validInDay);

                        return MembershipOption(
                          title: packageName,
                          price: '${package.price} Tomxu',
                          period: period,
                          note: 'Thanh toán theo năm',
                          discount: 'Tiết kiệm 10%',
                          backgroundColor: packageStyle!.backgroundColor,
                          textColor: packageStyle.backgroundColor == Colors.white ? packageStyle.buttonStyle.color! : Colors.white,
                          buttonColor: Colors.white,
                          buttonTextColor: packageStyle.buttonStyle.color!,
                          listDetails: packageStyle.listDetails,
                          onRegister: () {
                            _showBottomSheet(
                                context,
                                packageName,
                                packageStyle.listDetails.join("\n"),
                                '${package.price + (package.price * vat).toInt()} Tomxu',
                                period,
                                vat);
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}

class MembershipOption extends StatefulWidget {
  final String title;
  final String price;
  final String period;
  final String note;
  final String discount;
  final Color backgroundColor;
  final Color textColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final List<String> listDetails;
  final VoidCallback onRegister;

  const MembershipOption({
    super.key,
    required this.title,
    required this.price,
    required this.period,
    required this.note,
    required this.discount,
    required this.backgroundColor,
    required this.textColor,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.listDetails,
    required this.onRegister,
  });

  @override
  State<MembershipOption> createState() => _MembershipOptionState();
}

class _MembershipOptionState extends State<MembershipOption> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(
              widget.title,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                _isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                color: widget.textColor,
              ),
              onPressed: _toggleExpand,
            ),
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.price,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.period,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                widget.note,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  widget.discount,
                  style: TextStyle(
                    color: widget.buttonTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.onRegister,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.buttonColor,
              foregroundColor: widget.buttonTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Center(
              child: Text(
                'Đăng ký',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_isExpanded) ...[
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.listDetails.map((detail) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          detail,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class PremiumPackageStyles {
  final Color backgroundColor;
  final Border border;
  final TextStyle buttonStyle;
  final List<String> listDetails;

  PremiumPackageStyles({
    required this.backgroundColor,
    required this.border,
    required this.buttonStyle,
    required this.listDetails,
  });
}
