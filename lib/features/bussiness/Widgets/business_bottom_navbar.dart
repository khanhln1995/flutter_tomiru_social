import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tomiru_social_flutter/state/app_state.dart';
import 'package:tomiru_social_flutter/state/home_controller.dart';
import 'package:tomiru_social_flutter/ui/theme/theme.dart';
import 'package:tomiru_social_flutter/common/widgets/bottom_menu_bar/tab_item.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  });
  @override
  _BottomMenubarState createState() => _BottomMenubarState();
}

class _BottomMenubarState extends State<BottomNavBar> {
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
          _icon(Iconsax.share, 0, title: 'Mạng lưới'),
          _icon(Iconsax.hierarchy_square_2, 1, title: 'Quỹ đồng chia'),
          _icon(Iconsax.frame_3, 2, title: 'Thu nhập'),
          _icon(Iconsax.crown, 3, title: 'Thông tin gói'),
          _icon(Iconsax.award, 4, title: 'Gói thành viên'),
        ],
      ),
    );
  }

  Widget _icon(IconData iconData, int index, {String? title}) {
    final HomeController controller = Get.find();
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
