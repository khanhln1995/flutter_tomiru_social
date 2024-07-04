import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';
import 'package:tomiru_social_flutter/ui/theme/theme.dart';
import 'package:tomiru_social_flutter/widgets/bottom_menu_bar/tab_item.dart';
import 'package:tomiru_social_flutter/widgets/custom_widgets.dart';

class BottomMenubar extends StatefulWidget {
  const BottomMenubar({
    Key? key,
  });
  @override
  _BottomMenubarState createState() => _BottomMenubarState();
}

class _BottomMenubarState extends State<BottomMenubar> {
  @override
  void initState() {
    super.initState();
  }

  Widget _iconRow() {
    var state = Provider.of<AppState>(
      context,
    );
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
          _icon(null, 0,
              icon: 0 == state.pageIndex
                  ? AppIcon.access_time_filled
                  : AppIcon.access_time,
              title: 'Nhật ký',
              isCustomIcon: true),
          _icon(null, 1,
              icon: 1 == state.pageIndex
                  ? AppIcon.video_library_rounded
                  : AppIcon.video_library_outlined,
              title: 'Short',
              isCustomIcon: true),
          _icon(null, 2,
              title: 'Khám phá',
              icon: 2 == state.pageIndex
                  ? AppIcon.notificationFill
                  : AppIcon.notification,
              isCustomIcon: true),
          _icon(null, 3,
              title: 'Bạn bè',
              icon: 3 == state.pageIndex
                  ? AppIcon.supervisor_account_rounded
                  : AppIcon.supervisor_account_outlined,
              isCustomIcon: true),
          _icon(null, 4,
              title: 'Nhóm',
              icon: 4 == state.pageIndex
                  ? AppIcon.groups_2_rounded
                  : AppIcon.groups_2_outlined,
              isCustomIcon: true),
        ],
      ),
    );
  }

  Widget _icon(IconData? iconData, int index,
      {bool isCustomIcon = false, IconData? icon, String? title}) {
    if (isCustomIcon) {
      assert(icon != null);
    } else {
      assert(iconData != null);
    }
    var state = Provider.of<AppState>(
      context,
    );
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
                  icon: isCustomIcon
                      ? customIcon(context,
                          icon: icon!,
                          size: 22,
                          isTwitterIcon: true,
                          isEnable: index == state.pageIndex)
                      : Icon(
                          iconData,
                          color: index == state.pageIndex
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodySmall!.color,
                        ),
                  onPressed: () {
                    setState(() {
                      state.setPageIndex = index;
                    });
                  },
                ),
                title != null
                    ? Text(
                        title!,
                        style: TextStyle(
                          fontSize: 10,
                          color: index == state.pageIndex
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _iconRow();
  }
}
