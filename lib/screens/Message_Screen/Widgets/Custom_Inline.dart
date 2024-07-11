import 'package:flutter/cupertino.dart';
import 'package:tomiru_social_flutter/screens/Message_Screen/Widgets/Custom_Color.dart'
    as CustomAppColor;

class CustomInline extends StatelessWidget {
  final double width;

  const CustomInline({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 0.9,
      decoration: BoxDecoration(color: CustomAppColor.inline),
    );
  }
}
