import 'package:flutter/material.dart';

import 'package:tomiru_social_flutter/state/app_state.dart';

// import 'package:flutter_twitter_clone/ui/page/shortVideo/createShortVideo/createShortVideoPage.dart';
import 'package:tomiru_social_flutter/features/short_video/widgets/boxPositionTop.dart';
import 'package:tomiru_social_flutter/features/short_video/widgets/boxPositionBottom.dart';
import 'package:tomiru_social_flutter/features/short_video/widgets/boxPositionRight.dart';


import 'package:provider/provider.dart';
import 'video_playing.dart';

class ShortVideoPage extends StatefulWidget {
  final GlobalKey scaffoldKey;
  final Key? refreshIndicatorKey;

  const ShortVideoPage({
    Key? key,
    required this.scaffoldKey,
    this.refreshIndicatorKey,
  }) : super(key: key);

  @override
  State<ShortVideoPage> createState() => _ShortVideoPageState();
}

class _ShortVideoPageState extends State<ShortVideoPage> {
  late AppState state;
  int actionPage = 0;
  double _opacity = 1.0;
  @override
  void initState() {
    super.initState();
    state = Provider.of<AppState>(context, listen: false);
  }

  PageController _pageController = PageController();
  List<dynamic> videoUrls = [
    {
      'url': 'assets/videos/test-video-1.mp4',
      'userName': 'Trương Thanh Phong',
      'content': 'ô lalala',
      'tag': 'kuma',
      'music': 'test',
      'singer': 'test name',
      'like': "1999",
      "share": "200",
      "comment": "3000",
      'avatar': "https://imgupscaler.com/images/samples/Imgupscaler_1_2x.webp",
    },
    {
      'url': 'assets/videos/test-video-2.mp4',
      'userName': 'Trần Đắc Hiếu',
      'content':
          'Reloaded 39 of 2018 libraries in 5,968ms (compile: 856 ms,xyz)Reloaded 39 of 2018 libraries in 5,968ms (compile: 856 ms,xyz)',
      'tag': 'supperman',
      'music': 'test music',
      'singer': 'singer A',
      'like': "300",
      "share": "301",
      "comment": "1200",
      'avatar':
          "https://img-cdn.pixlr.com/image-generator/history/65ba5701b4f4f4419f746bc3/806ecb58-167c-4d20-b658-a6a6b2f221e9/medium.webp",
    },
    {
      'url': 'assets/videos/test-video-3.mp4',
      'userName': 'Nguyễn Ngọc Ngạn',
      'content': 'ô lalala',
      'tag': 'gấu',
      'music': 'test3',
      'like': "390",
      "share": "300",
      "comment": "1000",
      'singer': 'singer B',
      'avatar':
          "https://st2.depositphotos.com/2001755/8564/i/450/depositphotos_85647140-stock-photo-beautiful-landscape-with-birds.jpg",
    },
  ];
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _body() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          setState(() {
            _opacity = 0.0;
          });
        } else if (scrollNotification is ScrollEndNotification) {
          setState(() {
            _opacity = 1.0;
          });
        }
        return true;
      },
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: videoUrls.length,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });

          if (page > currentPage) {
            if (currentPage < videoUrls.length - 1) {
              currentPage++;
              _pageController.jumpToPage(currentPage);
            }
          } else if (page < currentPage) {
            if (currentPage > 0) {
              currentPage--;
              _pageController.jumpToPage(currentPage);
            }
          }
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                child: VideoPlayerScreen(
                  videoUrl: videoUrls[index]['url'],
                ),
              ),
              AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxPositionTop(scaffoldKey: widget.scaffoldKey),
                      BoxPositionBottom(data: videoUrls[index])
                    ],
                  )),
              Positioned(
                bottom: 80,
                right: 0,
                child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(milliseconds: 300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [BoxButtomRight(data: videoUrls[index])],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }
}
