import 'package:flutter/material.dart';

class HeaderContent extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const HeaderContent({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: onPressed,
            child: const Text("Tất cả", style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
