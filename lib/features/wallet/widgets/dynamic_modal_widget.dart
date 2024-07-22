import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/wallet/screens/qr_transaction_screen.dart';

class DynamicModalWidget extends StatelessWidget {
  final String title;
  final List<Map<String, String>> options;
  final IconData icon;

  const DynamicModalWidget({
    super.key,
    required this.title,
    required this.options,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ...options.map((option) => _buildOption(
                  context,
                  icon: icon,
                  title: option['title']!,
                  description: option['description']!,
                  color: theme.primaryColor,
                  onTap: option['onTap'],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required IconData icon,
      required String title,
      required String description,
      required Color color,
      String? onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QrTransactionScreen(),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 40.0),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0),
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
