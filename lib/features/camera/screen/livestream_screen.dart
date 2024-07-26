import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveStreamScreen extends StatelessWidget {
  const LiveStreamScreen({super.key});

  // final String userID = Random().nextInt(10000).toString();
  final String userID = "Khanh";

  void jumpToLivePage(BuildContext context, {required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivePage(isHost: false, userID: userID),
      ),
    );
  }
  // void jumpToHostPage(BuildContext context, {required bool isHost}) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LivePage(isHost: true, userID: userID),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Start a live'),
              onPressed: () => jumpToLivePage(context, isHost: true),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Watch a live'),
              onPressed: () => jumpToLivePage(context, isHost: false),
            ),
          ],
        ),
      ),
    );
  }
}

class LivePage extends StatelessWidget {
  const LivePage({super.key, required this.isHost, required this.userID});

  final bool isHost;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: 942463512, // Replace with your actual app ID
        appSign:
            'ae88eace62c35d1baf9bddbece597ac73e45532061b25d83cd1a95b95f241262', // Replace with your actual app Sign
        userID: userID,
        userName: 'user_$userID',
        liveID: "testLiveID",
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
