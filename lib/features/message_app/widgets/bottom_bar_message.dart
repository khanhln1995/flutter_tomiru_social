import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';
import 'package:tomiru_social_flutter/state/message_controller.dart';
import 'package:tomiru_social_flutter/ui/theme/theme.dart';
import 'package:tomiru_social_flutter/common/widgets/bottom_menu_bar/tab_item.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_widgets.dart';

class BottomBarMessage extends StatefulWidget {
  const BottomBarMessage({
    Key? key,
  });
  @override
  _BottomBarMessageState createState() => _BottomBarMessageState();
}

class _BottomBarMessageState extends State<BottomBarMessage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _iconRow() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarTheme.color,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, -.1), blurRadius: 0)
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _icon(Iconsax.message, 0, title: 'Tin nhắn'.tr),
          _icon(Iconsax.book, 1, title: 'Danh bạ'),
          _icon(Iconsax.calendar, 2, title: 'Lịch nhắc hẹn'),
          _icon(Iconsax.setting, 3, title: 'Cài đặt'),
          
        ],
      ),
    );
  }

  Widget _icon(IconData iconData, int index, {String? title}) {
    final MessageController controller = Get.find();
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedAlign(
          duration: const Duration(milliseconds: ANIM_DURATION),
          curve: Curves.easeIn,
          alignment: const Alignment(0, ICON_ON),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: ANIM_DURATION),
            opacity: ALPHA_ON,
            child: Column(
              children: [
                IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: const EdgeInsets.only(top: 20),
                  // alignment: const Alignment(0, 0),
                  icon: Icon(
                    iconData,
                    color: index == controller.pageIndex.value
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).textTheme.bodySmall!.color,
                  ),
                  onPressed: () {
                    setState(() {
                      controller.setPageIndex(index);
                    });
                  },
                ),
                title != null
                    ? Text(
                        title,
                        style: TextStyle(
                          fontSize: 10,
                          color: index == controller.pageIndex.value
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _iconRow());
  }
}
