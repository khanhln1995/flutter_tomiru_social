import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class CreateDetail extends StatelessWidget {
  final List<File>? images;
  final File? video;

  CreateDetail({this.images, this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        title: Text(
          'Đồng bộ âm thanh',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => _onMenuItemSelected(context, item),
            icon: Icon(Icons.more_horiz, color: Colors.white),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Option 1'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('Option 2'),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 40, 40, 40),
            child: Center(
              child: video != null
                  ? GestureDetector(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: VideoPlayerWidget(videoFile: video!),
                      ),
                    )
                  : images != null && images!.isNotEmpty
                      ? GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.file(
                              images!.first,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Text('No media selected.'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.music_note, color: Colors.white),
                Text(
                  'Thêm âm thanh',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuItemSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        // Xử lý Option 1
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Option 1 selected'),
        ));
        break;
      case 1:
        // Xử lý Option 2
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Option 2 selected'),
        ));
        break;
    }
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;

  const VideoPlayerWidget({Key? key, required this.videoFile})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : CircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
