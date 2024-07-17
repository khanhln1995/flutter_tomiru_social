import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isPlaying = true;
  bool isPaused = false;
  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.networkUrl(
    //   Uri.parse(
    //     'https://youtu.be/Jokpt_LJpbw',
    //   ),
    // );
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    // Use the controller to loop the video.
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void togglePlayPause() {
    if (isPlaying) {
      _controller.pause();
      setState(() {
        isPaused = true;
      });
    } else {
      _controller.play();
      setState(() {
        isPaused = false;
      });
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        togglePlayPause();
      },
      child: Scaffold(
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: MediaQuery.of(context).size.aspectRatio,
                        child: VideoPlayer(_controller, key: UniqueKey()),
                      ),
                    ),
                  ),
                  if (isPaused)
                    Center(
                      child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          togglePlayPause();
                        },
                        color: Colors.white,
                        iconSize: 64.0,
                      ),
                    ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
