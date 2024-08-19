import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

class Voucher extends StatelessWidget {
  final String voucherName;
  final String description;
  final int salePrice;
  final String saleDescription;
  final String end;
  const Voucher(
      {super.key,
      required this.voucherName,
      required this.description,
      required this.salePrice,
      required this.saleDescription,
      required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 237, 239),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'đ${salePrice.toString()}',
                          style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        saleDescription,
                        style: TextStyle(fontSize: 12, color: Colors.red[800]),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: Center(
                    child: Dash(
                      direction: Axis.vertical,
                      length: constraints.maxHeight,
                      dashLength: 5,
                      dashColor: Colors.grey,
                    ),
                  ),
                ),
                Flexible(
                  flex: 64,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        voucherName,
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.red[800]),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.red[800],
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Kết thúc lúc $end',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                              softWrap: true,
                            ),
                          ),
                          SizedBox(width: 24.0),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Nhận',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: Size(60, 30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
