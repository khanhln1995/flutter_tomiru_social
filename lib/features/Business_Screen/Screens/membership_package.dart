import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_button_widget.dart';
import 'package:tomiru_social_flutter/features/Business_Screen/Screens/service_register.dart';
import 'package:tomiru_social_flutter/state/membership_controller.dart';
import 'package:tomiru_social_flutter/widgets/ui/customButton.dart';

class MembershipPackage extends StatelessWidget {
    Map<String, dynamic> membershipPrice1 = {
    'priceVND': '110.000 đ',
    'priceTomxu': 110
  };
      Map<String, dynamic> membershipPrice2 = {
    'priceVND': '1.320.000 đ',
    'priceTomxu': 1320
  };
  
  MembershipPackage({super.key});

  final MembershipController _controller = Get.put(MembershipController());

  void _showBottomSheet(BuildContext context, String title, String details, String price, String period) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
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
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
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
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                       title,
                        style: TextStyle(
                          fontSize: 14.94,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                      'TIẾT KIỆM 10%',
                      style: TextStyle(
                        fontSize: 10.86,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    ]),
                    SizedBox(height: 4),
                    Text.rich(
                            TextSpan(
                              text: price,
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 32.67),
                              children: [
                                TextSpan(
                                  text: period,
                                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 21.19),
                                ),
                              ]
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Center(
                  child: Text(
                    'Đăng ký và thanh toán',
                    style: TextStyle(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chọn gói thành viên phù hợp với bạn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              MembershipOption(
                title: 'Gói tiêu dùng',
                price: membershipPrice1["priceVND"],
                period: '/ tháng',
                note: 'Thanh toán theo năm',
                discount: 'Tiết kiệm 10%',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                buttonColor: Colors.white,
                buttonTextColor: Colors.black,
                onRegister: () {
                  _showBottomSheet(
                    context,
                    'Gói tiêu dùng',
                    'Điều khoản dịch vụ thanh toán: chấp nhận, phương thức, xác nhận, hủy bỏ, hoàn tiền, bảo mật thông tin, trách nhiệm khách hàng, thay đổi điều khoản, và liên hệ hỗ trợ. Khách hàng phải đảm bảo thông tin chính xác và đồng ý với các thay đổi.',
                    '110 Tomxu',
                    '/ tháng',
                  );
                },
              ),
              SizedBox(height: 16),
              MembershipOption(
                title: 'Gói kinh doanh',
                price: membershipPrice2["priceVND"],
                period: '/ tháng',
                note: 'Thanh toán theo năm',
                discount: 'Tiết kiệm 10%',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                buttonColor: Colors.white,
                buttonTextColor: Colors.blue,
                onRegister: () {
                  _showBottomSheet(
                    context,
                    'Gói kinh doanh',
                    'Điều khoản dịch vụ thanh toán: chấp nhận, phương thức, xác nhận, hủy bỏ, hoàn tiền, bảo mật thông tin, trách nhiệm khách hàng, thay đổi điều khoản, và liên hệ hỗ trợ. Khách hàng phải đảm bảo thông tin chính xác và đồng ý với các thay đổi.',
                    '1320 Tomxu',
                    '/ tháng',
                  
                  );
                },
              ),
            ],
          ),
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
  final VoidCallback onRegister;

  MembershipOption({
    required this.title,
    required this.price,
    required this.period,
    required this.note,
    required this.discount,
    required this.backgroundColor,
    required this.textColor,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.onRegister,
  });

  @override
  _MembershipOptionState createState() => _MembershipOptionState();
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
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
            Spacer(),
            IconButton(
              icon: Icon(
                _isExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                color: Colors.white,
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
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                widget.note,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.onRegister,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.buttonColor,
              foregroundColor: widget.buttonTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.12),
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            child: Center(
              child: Text(
                'Đăng ký',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          if (_isExpanded) ...[
            Divider(
              thickness: 1,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16),
            Text(
              'Chiết khấu 10-20% tại đại lý và điểm bán Tomiru cho mọi sản phẩm.',
              style: TextStyle(
                color: widget.textColor,
                fontSize: 14,
              ),
            ),
            Text(
              'Điểm danh, tích điểm nằm 2 mở thẻ miễn phí trọn đời.',
              style: TextStyle(
                color: widget.textColor,
                fontSize: 14,
              ),
            ),
            Text(
              'Giới thiệu thẻ đóng phí năm, hưởng 20% hoa hồng trực tiếp 264.000 đồng trên 1.320.000 đồng mỗi thẻ.',
              style: TextStyle(
                color: widget.textColor,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
