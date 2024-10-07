import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ui/theme/theme.dart';

Widget customTitleText(String? title, {BuildContext? context}) {
  return Text(
    title ?? '',
    style: const TextStyle(
      color: Colors.black87,
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w900,
      fontSize: 20,
    ),
  );
}

Widget customIcon(
  BuildContext context, {
  required IconData icon,
  bool isEnable = false,
  double size = 18,
  bool isTwitterIcon = true,
  bool isFontAwesomeSolid = false,
  Color? iconColor,
  double paddingIcon = 5,
}) {
  iconColor = iconColor ?? Theme.of(context).textTheme.bodySmall!.color;
  return Padding(
    padding: EdgeInsets.only(bottom: isTwitterIcon ? paddingIcon : 0),
    child: Icon(
      icon,
      size: size,
      color: isEnable ? Theme.of(context).primaryColor : iconColor,
    ),
  );
}

Widget customText(
  String? msg, {
  Key? key,
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  TextOverflow overflow = TextOverflow.visible,
  BuildContext? context,
  bool softWrap = true,
  int? maxLines,
}) {
  if (msg == null) {
    return const SizedBox(
      height: 0,
      width: 0,
    );
  } else {
    if (context != null && style != null) {
      var fontSize =
          style.fontSize ?? Theme.of(context).textTheme.bodyMedium!.fontSize;
      style = style.copyWith(
        fontSize: fontSize! - (context.width <= 375 ? 2 : 0),
      );
    }
    return Text(
      msg,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      key: key,
      maxLines: maxLines,
    );
  }
}

Widget loader() {
  if (Platform.isIOS) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}
