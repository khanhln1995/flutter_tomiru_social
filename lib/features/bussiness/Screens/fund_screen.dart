import 'package:flutter/material.dart';

class FundScreen extends StatelessWidget {
  const FundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            FundCard(
              avatar: '🫙',
              title: 'Quỹ 1 - 10%',
              amount: '1,123,100,000',
              unit: 'TOMXU',
              members: '10 thành viên hợp lệ sẽ\nđược nhận thưởng',
              timeLeft: '03d : 12h : 24m : 60s',
            ),
            SizedBox(height: 16),
            FundCard(
              avatar: '🫙',
              title: 'Quỹ 2 - 20%',
              amount: '1,123,120',
              unit: 'TOMXU',
              members: '10 thành viên hợp lệ sẽ\nđược nhận thưởng',
              timeLeft: '03d : 12h : 24m : 60s',
            ),
            SizedBox(height: 16),
            FundCard(
              avatar: '🫙',
              title: 'Quỹ 3 - 30%',
              amount: '1,000',
              unit: 'TOMXU',
              members: '10 thành viên hợp lệ sẽ\nđược nhận thưởng',
              timeLeft: '03d : 12h : 24m : 60s',
            ),
            SizedBox(height: 16),
            FundCard(
              avatar: '🫙',
              title: 'Quỹ 4 - 40%',
              amount: '0',
              unit: 'TOMXU',
              members: '10 thành viên hợp lệ sẽ\nđược nhận thưởng',
              timeLeft: '03d : 12h : 24m : 60s',
            ),
          ],
        ),
      ),
    );
  }
}

class FundCard extends StatelessWidget {
  final String? avatar;
  final String title;
  final String amount;
  final String unit;
  final String members;
  final String timeLeft;

  const FundCard({
    Key? key,
    this.avatar,
    required this.title,
    required this.amount,
    required this.unit,
    required this.members,
    required this.timeLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  avatar!,
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 8),
                Text(
                  amount,
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
            // const SizedBox(width: 16), // Add padding between columns

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.info_outline, size: 18),
                  ],
                ),
                const SizedBox(height: 8),
                Text(members),
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
          ],
        ),
      ),
    );
  }
}
