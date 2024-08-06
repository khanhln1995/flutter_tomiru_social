import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/custom_loader.dart';
import 'package:tomiru_social_flutter/features/Feed/Widgets/user_post_bar.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Shorts.dart';
import 'package:tomiru_social_flutter/common/widgets/global/newWidget/emptyList.dart';
import 'package:tomiru_social_flutter/features/Feed/Widgets/extra_detail.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/time_line.dart';
import 'package:tomiru_social_flutter/features/Feed/Widgets/top_menu_bar.dart';
// import 'package:flutter_twitter_clone/state/feedState.dart';
// import 'package:provider/provider.dart';

class FeedPageBody extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey<RefreshIndicatorState>? refreshIndicatorKey;
  FeedPageBody({Key? key, required this.scaffoldKey, this.refreshIndicatorKey})
      : super(key: key);

  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  @override
  State<FeedPageBody> createState() => _FeedPageBodyState();
}

class _FeedPageBodyState extends State<FeedPageBody> {
  Widget _body(context, state, child) {
    final List? list = [];
    return CustomScrollView(
      slivers: <Widget>[
        child!,
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
            : list.isEmpty
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

  Widget _home() {
    return Column(
      children: [
        const UserPostBar(),
        const SizedBox(height: 10),
        HorizontalImageListScreen(),
        const SizedBox(height: 10),
        const ExtraDetail(),
        const SizedBox(height: 10),
        // const TimeLine(),
        const SizedBox(height: 10)
      ],
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.pageIndexNotifier,
      builder:( (context, index, child) {
        // return Consumer<FeedState>(
        //   builder: (context, state, child) {
        //     return _body(context, state, child);
        //   },
        return _body(context, index, child);
      }),
      child: const TopMenuBar(),
    );
  }
}
