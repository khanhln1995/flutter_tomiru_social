import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tomiru_social_flutter/features/short_video/controller/short_video_controller.dart';
import 'package:tomiru_social_flutter/features/short_video/widgets/boxPositionTop.dart';
import 'package:tomiru_social_flutter/features/short_video/widgets/boxPositionBottom.dart';
import 'package:tomiru_social_flutter/features/short_video/widgets/boxPositionRight.dart';

import 'video_playing.dart';

class ShortVideoPage extends StatelessWidget {
  final GlobalKey scaffoldKey;
  final Key? refreshIndicatorKey;

  const ShortVideoPage({
    super.key,
    required this.scaffoldKey,
    this.refreshIndicatorKey,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is put only once
    final ShortVideoController controller = Get.put(ShortVideoController());


    return Scaffold(
      body: GetBuilder<ShortVideoController>(
        builder: (controller) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollNotification) {
              controller.onScrollUpdate(scrollNotification);
              return true;
            },
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: controller.pageController,
              itemCount: controller.videoUrls.length,
              onPageChanged: (int page) {
                controller.onPageChanged(page);
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      child: VideoPlayerScreen(
                        videoUrl: controller.videoUrls[index]['url'],
                      ),
                    ),
                    Obx(() => AnimatedOpacity(
                      opacity: controller.opacity.value,
                      duration: Duration(milliseconds: 300),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoxPositionTop(scaffoldKey: scaffoldKey),
                          BoxPositionBottom(data: controller.videoUrls[index]),
                        ],
                      ),

                    )),
                    Positioned(
                      bottom: 80,
                      right: 0,
                      child: Obx(() => AnimatedOpacity(
                        opacity: controller.opacity.value,
                        duration: Duration(milliseconds: 300),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoxButtomRight(data: controller.videoUrls[index])
                          ],
                        ),
                      )),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
