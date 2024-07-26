import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShortVideoController extends GetxController {
  var actionPage = 0.obs;
  var opacity = 1.0.obs;
  var currentPage = 0.obs;

  final PageController pageController = PageController();
  final List<dynamic> videoUrls = [
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

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int page) {
    currentPage.value = page;
    if (page > currentPage.value) {
      if (currentPage.value < videoUrls.length - 1) {
        currentPage.value++;
        pageController.jumpToPage(currentPage.value);
      }
    } else if (page < currentPage.value) {
      if (currentPage.value > 0) {
        currentPage.value--;
        pageController.jumpToPage(currentPage.value);
      }
    }
  }

  void onScrollUpdate(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollUpdateNotification) {
      opacity.value = 0.0;
    } else if (scrollNotification is ScrollEndNotification) {
      opacity.value = 1.0;
    }
  }
}
