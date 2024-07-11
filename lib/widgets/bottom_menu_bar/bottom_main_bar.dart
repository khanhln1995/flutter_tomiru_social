import 'package:flutter/material.dart';
import '../../state/app_state.dart';
import '../../ui/theme/theme.dart';
import './tab_item.dart';
import 'package:provider/provider.dart';

import '../custom_widgets.dart';

class BottomMainBar extends StatefulWidget {
  const BottomMainBar({
    Key? key,
  });

  @override
  _BottomMainBarState createState() => _BottomMainBarState();
}

class _BottomMainBarState extends State<BottomMainBar> {
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
                  ? AppIcon.home_rounded
                  : AppIcon.home_outlined,
              title: 'Trang chủ',
              isCustomIcon: true),
          _icon(null, 1,
              icon: 1 == state.pageIndex
                  ? AppIcon.message_rounded
                  : AppIcon.message_outlined,
              title: 'Tin nhắn',
              isCustomIcon: true,
              badgeCount: 1),
          _icon(null, 2,
              title: 'Thông báo',
              icon: 2 == state.pageIndex
                  ? AppIcon.notifications_none_rounded
                  : AppIcon.notifications_none_outlined,
              isCustomIcon: true,
              badgeCount: 2),
          _icon(null, 3,
              title: 'Tài khoản',
              icon: 3 == state.pageIndex
                  ? AppIcon.account_circle_rounded
                  : AppIcon.account_circle_outlined,
              isCustomIcon: true),
        ],
      ),
    );
  }

  Widget _icon(IconData? iconData, int index,
      {bool isCustomIcon = false,
      IconData? icon,
      String? title,
      int badgeCount = 0}) {
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
                Stack(
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      padding: const EdgeInsets.only(top: 20),
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
                                  : Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                            ),
                      onPressed: () {
                        setState(() {
                          state.setPageIndex = index;
                        });
                      },
                    ),
                    if (badgeCount > 0)
                      Positioned(
                        top: 10,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 15,
                            minHeight: 15,
                          ),
                          child: Text(
                            '$badgeCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                  ],
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
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Colors.grey[300] ?? Colors.grey, width: 1.0))),
      child: _iconRow(),
    );
  }
}
