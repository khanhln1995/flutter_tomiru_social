import 'package:flutter/material.dart';

class WithdrawalHistoryWidget extends StatelessWidget {
  const WithdrawalHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Transactions',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'May 2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          _buildTransactionItem(
            context,
            'Withdrawal Request XYZ123',
            'Before: 1200 Tomxu',
            'After: 900 Tomxu',
            'Requested Date: 14/6/2021',
            '13:00 - 17/6/2021',
            '-300 Tomxu',
            'Completed',
            Colors.green,
          ),
          _buildTransactionItem(
            context,
            'Withdrawal Request XYZ123',
            'Before: 1200 Tomxu',
            'After: 900 Tomxu',
            'Requested Date: 14/6/2021',
            '13:00 - 17/6/2021',
            '-300 Tomxu',
            'Rejected',
            Colors.red,
          ),
          _buildTransactionItem(
            context,
            'Withdrawal Request XYZ123',
            'Before: 1200 Tomxu',
            'After: 900 Tomxu',
            'Requested Date: 14/6/2021',
            '13:00 - 17/6/2021',
            '-300 Tomxu',
            'Processing',
            Colors.blue,
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'April 2024',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          _buildTransactionItem(
            context,
            'Withdrawal Request XYZ123',
            'Before: 1200 Tomxu',
            'After: 900 Tomxu',
            'Requested Date: 14/6/2021',
            '13:00 - 17/6/2021',
            '-300 Tomxu',
            'Completed',
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    String title,
    String beforeBalance,
    String afterBalance,
    String requestDate,
    String processingTime,
    String amount,
    String status,
    Color statusColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      beforeBalance,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 12.0),
                    ),
                    Text(
                      afterBalance,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 12.0),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      requestDate,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                          color: statusColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      amount,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      processingTime,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
