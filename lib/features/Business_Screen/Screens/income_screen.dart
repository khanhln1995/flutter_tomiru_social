import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  String _selectedMonth = 'Tháng';

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
                      Column(
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
                            Text(
                              '(20 thành viên)',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Tháng 5,2024',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Text('Xem tất cả',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.w500)),
                  ),
                  TransactionTile(
                    title: 'Nạp tiền vào ví từ Vietcombank',
                    amount: '+2,000,000 đ',
                    status: 'Thành công',
                    date: '14/6/2021',
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  TransactionTile(
                    title: 'Rút tiền từ ví về tài khoản',
                    amount: '+2,000,000 đ',
                    status: 'Thành công',
                    date: '14/6/2021',
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  TransactionTile(
                    title: 'Nạp tiền vào ví từ Vietcombank',
                    amount: '+2,000,000 đ',
                    status: 'Thành công',
                    date: '14/6/2021',
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  TransactionTile(
                    title: 'Rút tiền từ ví về tài khoản',
                    amount: '+2,000,000 đ',
                    status: 'Thành công',
                    date: '14/6/2021',
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  TransactionTile(
                    title: 'Nạp tiền vào ví từ Vietcombank',
                    amount: '+2,000,000 đ',
                    status: 'Thất bại',
                    date: '14/6/2021',
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

class TransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final String status;
  final String date;

  const TransactionTile({
    Key? key,
    required this.title,
    required this.amount,
    required this.status,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      ),
      subtitle: Text(
        status,
        style: TextStyle(
          color: status == 'Thành công' ? Colors.green : Colors.red,
          fontSize: 12,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(amount, style: TextStyle(fontWeight: FontWeight.w400)),
          Text(date, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
