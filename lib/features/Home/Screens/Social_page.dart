import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_icon.dart';
import 'package:tomiru_social_flutter/features/Feed/Widgets/user_post_bar.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/time_line.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Shorts.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/emptyList.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/custom_loader.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_icon_widgets.dart';

class SocialNetworkPage extends StatefulWidget {
  SocialNetworkPage({super.key});
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  @override
  State<SocialNetworkPage> createState() => _SocialNetworkPageState();
}

class _SocialNetworkPageState extends State<SocialNetworkPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _home() {
    return Column(
      children: [
        const UserPostBar(),
        const SizedBox(height: 10),
        HorizontalImageListScreen(),
        const SizedBox(height: 10),
        const TimeLine(),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget _body(context, state, child) {
    final List? list = [];
    return CustomScrollView(
      slivers: <Widget>[
        if (child != null) child,
        list == null
            ? SliverToBoxAdapter(
                child: SizedBox(
                  height: context.height - 135,
                  child: const CustomScreenLoader(
                    height: double.infinity,
                    width: double.infinity,
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : list == null
                ? const SliverToBoxAdapter(
                    child: EmptyList(
                      'No Tweet added yet',
                      subTitle:
                          'When new Tweet added, they\'ll show up here \n Tap tweet button to add new',
                    ),
                  )
                : SliverToBoxAdapter(
                    // child: getPage(widget.pageIndexNotifier.value),
                    child: _home(),
                  ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(230, 236, 240, 1.0),
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        titleText: 'Mạng xã hội',
        padding: 0,
        widget: [
          customMessage(context),
          customNotification(context),
          const SizedBox(width: 12.0)
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.pageIndexNotifier,
        builder: (context, index, child) {
          // return Consumer<FeedState>(
          //   builder: (context, state, child) {
          //     return _body(context, state, child);
          //   },
          return _body(context, index, child);
        },
      ),
    );
  }
}
