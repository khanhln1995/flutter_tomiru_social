import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  final String description;
  final String amount;
  final String status;
  final String startTime;
  final String endTime;

  const TransactionItemWidget({
    super.key,
    required this.description,
    required this.amount,
    required this.status,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description, style: const TextStyle(color: Colors.black)),
          const SizedBox(height: 8.0),
          if (startTime.isNotEmpty && endTime.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ngày bắt đầu: $startTime',
                    style: const TextStyle(color: Colors.grey)),
                Text('Ngày kết thúc: $endTime',
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8.0),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(status, style: const TextStyle(color: Colors.green)),
              Text(amount,
                  style: TextStyle(
                      color:
                          amount.startsWith('-') ? Colors.red : Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
