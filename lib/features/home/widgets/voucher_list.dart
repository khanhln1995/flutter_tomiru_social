import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/widgets/global/voucher/custom_voucher.dart';

class VerticalVoucherList extends StatelessWidget {
  // const VerticalVoucherList({super.key});
  final List<Map<String, dynamic>> vouchers = [
    {
      "voucher_name": "Voucher bạn mới",
      "voucher_description": 'Dành riêng cho khách hàng mới',
      "voucher_sale": 30000,
      "sale_description": "Đơn hàng từ 0đ",
      "date_end": "18 thg 5, 11:59PM"
    },
    {
      "voucher_name": "Voucher bạn cu",
      "voucher_description": 'Dành riêng cho khách hàng cu',
      "voucher_sale": 20000,
      "sale_description": "Đơn hàng từ 100000đ",
      "date_end": "18 thg 5, 11:59PM"
    },
    {
      "voucher_name": "Voucher bạn mới",
      "voucher_description": 'Dành riêng cho khách hàng mới',
      "voucher_sale": 30000,
      "sale_description": "Đơn hàng từ 0đ",
      "date_end": "18 thg 5, 11:59PM"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: MediaQuery.of(context).size.height / 2.8,
      child: GridView.builder(
        physics: PageScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (MediaQuery.of(context).size.width * 0.78)/ MediaQuery.of(context).size.height ,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          return Voucher(
              voucherName: vouchers[index]['voucher_name'],
              description: vouchers[index]['voucher_description'],
              salePrice: vouchers[index]['voucher_sale'],
              saleDescription: vouchers[index]['sale_description'],
              end: vouchers[index]['date_end']);
        }),
    );
  }
}
