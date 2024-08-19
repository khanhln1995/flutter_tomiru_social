import 'package:flutter/material.dart';
// import 'package:tomiru_social_flutter/common/widgets/global/time_line/post.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/post2.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/features/Feed/Widgets/user_post_bar.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/time_line.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Shorts.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_icon_widgets.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SocialNetworkPage extends StatefulWidget {
  SocialNetworkPage({super.key});
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  @override
  State<SocialNetworkPage> createState() => _SocialNetworkPageState();
}

class _SocialNetworkPageState extends State<SocialNetworkPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _page = 0;
  final int _limit = 3;
  List<Post2> demoData = [];
  List<Author> userData = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _loadPosts();
      }
    });
  }

  Future<void> _loadPosts() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate a network call
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle.loadString('assets/feed.json');

    
    List<dynamic> jsonList = jsonDecode(jsonData);
    List<Post2> loadedPosts =
        jsonList.skip(_page * _limit).take(_limit).map((json) {
      // Lấy dữ liệu tác giả từ JSON và thêm vào danh sách userData
      userData.add(Author.fromJson(json['author']));
      return Post2.fromJson(json);
    }).toList();

    setState(() {
      demoData.addAll(loadedPosts);
      _page++;
      _isLoading = false;
    });
  }

  Future<void> _refreshPosts() async {
    setState(() {
      _page = 0;
      demoData.clear();
    });
    await _loadPosts();
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
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
          const SizedBox(width: 12.0),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshPosts,
        child: ValueListenableBuilder<int>(
          valueListenable: widget.pageIndexNotifier,
          builder: (context, index, child) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverToBoxAdapter(
                  child: UserPostBar(),
                ),
                SliverToBoxAdapter(
                  child: HorizontalImageListScreen(),
                ),
                TimeLine(
                  scrollController: _scrollController,
                  demoData: demoData,
                  isLoading: _isLoading,
                  userData: userData,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 10), // Add spacing if needed
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
