import 'package:flutter/cupertino.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomInline extends StatelessWidget {
  final double width;

  const CustomInline({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 0.97,
      decoration: BoxDecoration(color: CustomAppColor.inline),
    );
  }
}
