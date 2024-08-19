import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/global/voucher/custom_voucher.dart';

class VerticalVoucherList extends StatefulWidget {
  const VerticalVoucherList({super.key});
  @override
  State<VerticalVoucherList> createState() => _VerticalVoucherListState();
}

class _VerticalVoucherListState extends State<VerticalVoucherList> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  final List<Map<String, dynamic>> vouchers = [
    {
      "voucher_name": "Voucher bạn mới",
      "voucher_description": 'Dành riêng cho khách hàng mới',
      "voucher_sale": 30000,
      "sale_description": "Đơn hàng từ 0đ",
      "date_end": "18 thg 5, 11:59PM"
    },
    {
      "voucher_name": "Voucher bạn cũ",
      "voucher_description": 'Dành riêng cho khách hàng cũ',
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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 2 / 5,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: (vouchers.length / 2).ceil(),
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * 2;
              return Column(
                children: [
                  for (var i = startIndex;
                      i < startIndex + 2 && i < vouchers.length;
                      i++)
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
                        child: Voucher(
                          voucherName: vouchers[i]['voucher_name'],
                          description: vouchers[i]['voucher_description'],
                          salePrice: vouchers[i]['voucher_sale'],
                          saleDescription: vouchers[i]['sale_description'],
                          end: vouchers[i]['date_end'],
                        ),
                      ),
                    ),
                  if (startIndex + 1 >= vouchers.length)
                    const Flexible(flex: 1, child: SizedBox()),
                ],
              );
            },
          ),
        ),
        pageViewIndicator(),
        const SizedBox(height: 16.0)
      ],
    );
  }

  Widget pageViewIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
          (vouchers.length / 2).ceil(),
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: _activePage == index
                              ? Colors.red.withOpacity(0.6)
                              : Colors.transparent,
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ]),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: _activePage == index
                            ? Colors.red[300]
                            : Colors.grey,
                      ),
                    )),
              )),
    );
  }
}
