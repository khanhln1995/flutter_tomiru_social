import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final int? quantity;
  final Widget icon;
  const CustomIcon(
      {super.key, this.onPressed, this.quantity, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: icon,
              iconSize: 30,
            ),
          ),
          if (quantity != null && quantity! > 0)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          SizedBox(width: MediaQuery.of(context).size.width /7)
        ],
      ),
    );
  }
}
