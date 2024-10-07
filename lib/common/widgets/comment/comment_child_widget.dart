// src: https://github.com/dangngocduc/comment_tree
import 'package:tomiru_social_flutter/ui/theme/tree_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentChildWidget extends StatelessWidget {
  final PreferredSizeWidget? avatar;
  final Widget? content;
  final bool? isLast;
  final Size? avatarRoot;

  const CommentChildWidget({
    super.key,
    required this.isLast,
    required this.avatar,
    required this.content,
    required this.avatarRoot,
  });

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding =
        EdgeInsets.only(left: avatarRoot!.width + 8.0, bottom: 8, top: 8);

    return CustomPaint(
      painter: _Painter(
        isLast: isLast!,
        padding: padding,
        avatarRoot: avatarRoot,
        avatarChild: avatar!.preferredSize,
        pathColor: context.watch<TreeThemeData>().lineColor,
        strokeWidth: context.watch<TreeThemeData>().lineWidth,
      ),
      child: Container(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avatar!,
            const SizedBox(
              width: 8,
            ),
            Expanded(child: content!),
          ],
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  bool isLast = false;

  EdgeInsets? padding;

  Size? avatarRoot;
  Size? avatarChild;
  Color? pathColor;
  double? strokeWidth;

  _Painter({
    required this.isLast,
    this.padding,
    this.avatarRoot,
    this.avatarChild,
    this.pathColor,
    this.strokeWidth,
  }) {
    _paint = Paint()
      ..color = pathColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!
      ..strokeCap = StrokeCap.round;
  }

  late Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(avatarRoot!.width / 2, 0);
    path.cubicTo(
      avatarRoot!.width / 2,
      15, // thay doi bo goc
      avatarRoot!.width / 2,
      padding!.top + avatarChild!.height / 2,
      avatarRoot!.width,
      padding!.top + avatarChild!.height / 2,
    );
    canvas.drawPath(path, _paint);

    if (!isLast) {
      canvas.drawLine(
        Offset(avatarRoot!.width / 2, 0),
        Offset(avatarRoot!.width / 2, size.height),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}