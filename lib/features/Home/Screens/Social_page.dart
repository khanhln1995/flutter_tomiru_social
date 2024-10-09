import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:tomiru_social_flutter/common/widgets/global/time_line/post.dart';
// import 'package:tomiru_social_flutter/common/widgets/global/time_line/post2.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/features/Feed/Widgets/user_post_bar.dart';
import 'package:tomiru_social_flutter/common/widgets/global/time_line/time_line.dart';
import 'package:tomiru_social_flutter/features/Feed/Screens/Feed_Shorts.dart';
import 'package:tomiru_social_flutter/common/widgets/custom_icon_widgets.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:tomiru_social_flutter/features/social_tweet/controller/social_controller.dart';
import 'package:tomiru_social_flutter/features/social_tweet/domain/models/tweet.dart';

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
  List<Author> userData = [];

  @override
  void initState() {
    super.initState();
    _initTweets();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _loadPosts();
      }
    });
  }

  Future<void> _initTweets() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Get.find<SocialController>().getTweets(_page);
      _extractUserData(); // Lấy dữ liệu người dùng ngay sau khi tải tweets
    } catch (e) {
      print("Error fetching tweets: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadPosts() async {
    // Thay đổi để tránh tải lại khi đang trong quá trình tải dữ liệu
    if (_isLoading) return;

    setState(() {
      _isLoading = true; // Đánh dấu bắt đầu tải dữ liệu
    });

    // Tăng số lượng trang
    _page++;

    try {
      await Get.find<SocialController>().getTweets(_page);
      _extractUserData(); // Lấy dữ liệu người dùng cho tweets mới
    } catch (e) {
      print("Error loading more tweets: $e");
    } finally {
      setState(() {
        _isLoading = false; // Đánh dấu hoàn thành tải dữ liệu
      });
    }
  }

  void _extractUserData() {
    final socialController = Get.find<SocialController>();
    userData.clear();

    for (var tweet in socialController.tweets) {
      userData.add(tweet.author);
    }
  }

  Future<void> _refreshPosts() async {
    setState(() {
      _page = 0;
    });
    await _initTweets();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    Get.find<SocialController>().clearTweets();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final socialController = Get.find<SocialController>();

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
                SliverToBoxAdapter(
                  child: socialController.tweets.isEmpty && !_isLoading
                      ? const Center(
                          child: Text("Không có tweet nào để hiển thị."),
                        )
                      : _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue)),
                            )
                          : const SizedBox.shrink(),
                ),
                if (socialController.tweets.isNotEmpty) ...[
                  TimeLine(
                    scrollController: _scrollController,
                    demoData: socialController.tweets,
                    isLoading: _isLoading,
                    userData: userData,
                  ),
                ],
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
              ],
            );
          },
        ),
      ),
    );
  }
}
