import 'package:flutter/material.dart';

class TransactionItemWidget extends StatelessWidget {
  final String description;
  final String amount;
  final String status;
  final String startTime;
  final String endTime;
  final String balanceAfter;
  final bool isPackage;

  const TransactionItemWidget({
    super.key,
    required this.description,
    required this.amount,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.balanceAfter,
    required this.isPackage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const smallerTextStyle = TextStyle(color: Colors.grey, fontSize: 12.0);
    const boldTextStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);
    final amountTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
      color: amount.startsWith('-') ? Colors.red : Colors.green,
    );

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(description, style: boldTextStyle),
              Text(status, style: const TextStyle(color: Colors.green)),
            ],
          ),
          const SizedBox(height: 8.0),
          if (isPackage) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ngày gia hạn: $startTime', style: smallerTextStyle),
                Text(amount, style: amountTextStyle),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ngày hết hạn: $endTime', style: smallerTextStyle),
                Text('Sau GD: $balanceAfter', style: smallerTextStyle),
              ],
            ),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ngày GD: $startTime', style: smallerTextStyle),
                Text(amount, style: amountTextStyle),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(), // Placeholder to align "Sau GD"
                Text('Sau GD: $balanceAfter', style: smallerTextStyle),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
