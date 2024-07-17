import 'package:flutter/material.dart';

// import 'package:flutter_twitter_clone/ui/page/shortVideo/createShortVideo/createDetail.dart';
import "package:tomiru_social_flutter/features/short_video/screens/create_short_video/create_detail.dart";

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class ImageVideoPickerItem extends StatefulWidget {
  const ImageVideoPickerItem({Key? key}) : super(key: key);

  @override
  State<ImageVideoPickerItem> createState() => _ImageVideoPickerItemState();
}

class _ImageVideoPickerItemState extends State<ImageVideoPickerItem> {
  List<File> _images = [];
  File? _video;
  final ImagePicker _picker = ImagePicker();
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    if (_video != null) {
      _controller = VideoPlayerController.file(_video!);
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
    }
    print(
        '~~~~~~~~~~~~~~~~~~~~~~~~~~~ImageVideoPicker~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  }

  Future<void> _pickMedia(bool isCamera, bool isImage) async {
    List<XFile>? pickedFiles = await _picker.pickMultipleMedia();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      bool containsVideo =
          pickedFiles.any((file) => file.path.toLowerCase().endsWith('.mp4'));
      bool containsImage =
          pickedFiles.any((file) => !file.path.toLowerCase().endsWith('.mp4'));

      if (containsVideo && containsImage) {
        // Show error if both video and image are selected
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Bạn không thể chọn cả ảnh và video cùng lúc.'),
        ));
        return;
      }

      setState(() {
        if (containsVideo) {
          // If video is picked
          _video = File(pickedFiles
              .firstWhere((file) => file.path.toLowerCase().endsWith('.mp4'))
              .path);
          _images.clear(); // Clear images if a new video is picked

          if (_controller.value.isInitialized) {
            _controller.pause();
            _controller.dispose();
          }

          _controller = VideoPlayerController.file(_video!);
          _initializeVideoPlayerFuture = _controller.initialize();
          _controller.setLooping(true);
        } else {
          // If images are picked
          _images = pickedFiles.map((file) => File(file.path)).toList();
          _video = null; // Clear video if new images are picked
        }
      });
    }
  }

  Future<void> _cameraHandler() async {
    final pickedFile = await _picker.pickVideo(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
        _images.clear(); // Clear images if a new video is picked

        if (_controller.value.isInitialized) {
          _controller.pause();
          _controller.dispose();
        }

        _controller = VideoPlayerController.file(_video!);
        _initializeVideoPlayerFuture = _controller.initialize();
        _controller.setLooping(true);
      });
    }
  }

  void _navigateToDisplayPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateDetail(images: _images, video: _video),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buttonIcon(_cameraHandler, Icons.camera_alt, 'Camera'),
              _buttonIcon(() {}, Icons.queue_music, 'Nhạc'),
              _buttonIcon(() {}, Icons.playlist_add_check_circle, 'Đã lưu'),
              _buttonIcon(() {}, Icons.pending_actions, 'Bản nháp'),
            ],
          ),
          const SizedBox(height: 40),
          _video != null
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: VideoPlayerWidget(
                    videoFile: _video!,
                    controller: _controller,
                    initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
                  ),
                )
              : _images.isNotEmpty
                  ? Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _images
                          .map((image) => Image.file(
                                image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ))
                          .toList(),
                    )
                  : const Text('No media selected.'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _pickMedia(false, true),
            child: const Text('Chọn tệp'),
          ),
          if (_video != null || _images.isNotEmpty)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: _navigateToDisplayPage,
                child: const Text('Tiếp tục'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buttonIcon(void Function() action, IconData icon, String text) {
    return Column(children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey.shade200,
        child: IconButton(
          icon: Icon(icon),
          color: Colors.black,
          onPressed: action,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: const TextStyle(fontSize: 11),
      ),
    ]);
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;
  final VideoPlayerController controller;
  final Future<void> initializeVideoPlayerFuture;

  const VideoPlayerWidget({
    Key? key,
    required this.videoFile,
    required this.controller,
    required this.initializeVideoPlayerFuture,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_videoListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_videoListener);
    super.dispose();
  }

  void _videoListener() {
    final isPlaying = widget.controller.value.isPlaying;
    if (_isPlaying != isPlaying) {
      setState(() {
        _isPlaying = isPlaying;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              if (widget.controller.value.isPlaying) {
                widget.controller.pause();
              } else {
                widget.controller.play();
              }
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            child: AspectRatio(
              aspectRatio: widget.controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  VideoPlayer(widget.controller),
                  if (!_isPlaying)
                    const Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
