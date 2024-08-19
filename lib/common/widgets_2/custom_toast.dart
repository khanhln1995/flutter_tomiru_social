import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/helper/responsive_helper.dart';
import 'package:tomiru_social_flutter/util/dimensions.dart';
import 'package:tomiru_social_flutter/util/styles.dart';

class CustomToast extends StatelessWidget {
  final String text;
  final bool isError;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomToast({
    super.key,
    required this.text,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
    this.borderRadius = 30,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: isError ? Colors.red : backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: padding,
            margin: EdgeInsets.only(
              right: ResponsiveHelper.isDesktop(Get.context)
                  ? Get.context!.width * 0.7
                  : Dimensions.paddingSizeLarge,
              left: Dimensions.paddingSizeLarge,
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                  isError
                      ? CupertinoIcons.multiply_circle_fill
                      : Icons.check_circle,
                  color: textColor,
                  size: 20),
              const SizedBox(width: Dimensions.paddingSizeSmall),
              Flexible(
                  child: Text(text,
                      style: robotoRegular.copyWith(color: textColor),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis)),
            ]),
          ),
        ),
      ),
    );
  }
}
