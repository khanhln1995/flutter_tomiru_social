import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/message/widgets/custom_color_widget.dart'
    as CustomAppColor;

class CustomPopupMenuButton extends StatelessWidget {
  final Widget groupCreationPage;
  final Widget newMessagePage;
  final Widget groupCalendarCreationPage;

  const CustomPopupMenuButton(
      {super.key,
      required this.groupCreationPage,
      required this.newMessagePage,
      required this.groupCalendarCreationPage});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> items = [
      {'icon': Icon(Icons.people_alt_outlined), 'title': 'Tạo nhóm'},
      {'icon': Icon(Icons.note_alt_outlined), 'title': 'Tin nhắn mới'},
      {'icon': Icon(Icons.calendar_month_outlined), 'title': 'Tạo lịch nhóm'},
    ];

    void _navigateToPage(String title) {
      if (title == 'Tạo nhóm') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => groupCreationPage),
        );
      } else if (title == 'Tin nhắn mới') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => newMessagePage),
        );
      } else if (title == 'Tạo lịch nhóm') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => groupCalendarCreationPage),
        );
      }
    }

    return IconButton(
      icon: Icon(Icons.add_circle_outline),
      onPressed: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;

        final Offset buttonPosition =
            button.localToGlobal(Offset.zero, ancestor: overlay);
        final Size buttonSize = button.size;

        final RelativeRect position = RelativeRect.fromLTRB(
          buttonPosition.dx + buttonSize.width - (size.width * 0.44),
          buttonPosition.dy + buttonSize.height,
          buttonPosition.dx + buttonSize.width,
          buttonPosition.dy + buttonSize.height,
        );

        showMenu(
          context: context,
          position: position,
          items: items.map((item) {
            return PopupMenuItem<String>(
              value: item['title'],
              child: Row(
                children: [
                  item['icon'],
                  SizedBox(width: size.width / 60),
                  Text(item['title']),
                ],
              ),
            );
          }).toList(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            side: BorderSide(
              width: 1,
              color: CustomAppColor.inline,
            ),
          ),
          elevation: 10,
          color: CustomAppColor.backgroundTextField,
        ).then((String? result) {
          _navigateToPage(result!);
        });
      },
    );
  }
}
