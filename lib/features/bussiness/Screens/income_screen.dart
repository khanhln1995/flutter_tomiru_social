import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tomiru_social_flutter/features/bussiness/Screens/history_member.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import "package:get/get.dart";
import 'package:intl/intl.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  String _selectedMonth = 'Tháng';

  List<WalletInfo> incomeList = [];

  @override
  void initState() {
    super.initState();
    Get.find<BusinessController>().getWalletInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thu nhập tháng 3',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(children: [
                            Text(
                              '500 Tomxu',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 9),
                            Image(
                              image: AssetImage("assets/images/send.png"),
                              width: 12,
                              height: 12,
                            ),
                            SizedBox(width: 9),
                            // Text(
                            //   '(20 thành viên)',
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //     fontWeight: FontWeight.w400,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ])
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        decoration: BoxDecoration(
                          // color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          value: _selectedMonth,
                          items: <String>[
                            'Tháng',
                            'Tháng 1',
                            'Tháng 2',
                            'Tháng 3',
                            'Tháng 4',
                            'Tháng 5',
                            'Tháng 6',
                            'Tháng 7'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedMonth = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 62),
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 500,
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                const titles = [
                                  'Tháng 1',
                                  'Tháng 2',
                                  'Tháng 3',
                                  'Tháng 4',
                                  'Tháng 5',
                                  'Tháng 6',
                                  'Tháng 7'
                                ];
                                return Text(titles[value.toInt()],
                                    style: TextStyle(fontSize: 12));
                              },
                            ),
                          ),
                          leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        barGroups: [
                          BarChartGroupData(x: 0, barRods: [
                            BarChartRodData(
                                toY: 200,
                                color: Colors.grey[300],
                                width: 30,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)))
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                toY: 250,
                                color: Colors.grey[300],
                                width: 30,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)))
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                toY: 500,
                                color: Colors.blue,
                                width: 30,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4))),
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                toY: 150,
                                color: Colors.grey[300],
                                width: 30,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)))
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                                toY: 300,
                                color: Colors.grey[300],
                                width: 30,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)))
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(
                                toY: 250,
                                color: Colors.grey[300],
                                width: 30,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)))
                          ]),
                          BarChartGroupData(x: 6, barRods: [
                            BarChartRodData(
                                toY: 220,
                                color: Colors.grey[300],
                                width: 30,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(4)))
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Tháng 5, 2024',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryMember()));
                      },
                      child: Text('Xem tất cả',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: incomeList.length,
                    itemBuilder: (context, index) {
                      int preBalance = incomeList[index].preBalance;
                      int postBalance = incomeList[index].postBalance;

                      String valuePrefix =
                          postBalance >= preBalance ? "+" : "-";
                      DateTime createdAtDateTime =
                          DateTime.fromMillisecondsSinceEpoch(
                              incomeList[index].createdAt);

                      String formattedDate =
                          DateFormat('dd/MM/yyyy').format(createdAtDateTime);
                      String formattedTime =
                          DateFormat('HH:mm:ss').format(createdAtDateTime);
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
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ],
                      );
                    },
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
