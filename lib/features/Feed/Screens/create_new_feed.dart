import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:tomiru_social_flutter/features/camera/screen/camera_screen.dart';
import 'package:tomiru_social_flutter/features/camera/screen/livestream_screen.dart';

import 'package:tomiru_social_flutter/common/widgets/ui/customAppBar.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/customButton.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// import 'post.dart';
import "package:tomiru_social_flutter/common/widgets/global/time_line/post.dart";

class CreatedFeed extends StatefulWidget {
  const CreatedFeed({super.key});

  @override
  State<CreatedFeed> createState() => _CreatedFeedState();
}

class _CreatedFeedState extends State<CreatedFeed> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> items = ['Công khai', 'Chỉ mình tôi'];
  String? _selectedValue = 'Công khai';
  final FocusNode fieldFocus = FocusNode();
  final TextEditingController _controller = TextEditingController();
  List<XFile> images = [];

  @override
  void initState() {
    super.initState();
    fieldFocus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    fieldFocus.removeListener(_onFocusChange);
    fieldFocus.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    // print(fieldFocus.hasFocus);
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> pickedImages = await picker.pickMultiImage();

    if (pickedImages.isNotEmpty) {
      setState(() {
        images.addAll(pickedImages);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  void _onPictureTaken(XFile picture) {
    setState(() {
      images.add(picture);
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/posts.json');
  }

  Future<void> _writePost() async {
    final post = Post(
      userName: "Tony Nguyen",
      avatar: "assets/images/kem.jpg",
      content: _controller.text,
      images: images.map((image) => image.path).toList(),
      comment: [],
      like: "0",
      share: "0",
      createAt: DateTime.now().toIso8601String(),
    );

    final file = await _localFile;
    List<Map<String, dynamic>> posts = [];

    if (await file.exists()) {
      final contents = await file.readAsString();
      posts = List<Map<String, dynamic>>.from(json.decode(contents));
    }
    print("======================");
    print("posts: $posts");
    posts.add(post.toJson());
    await file.writeAsString(json.encode(posts));
  }

  Widget _body(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/kem.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tony Nguyen',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4.0),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          customButton: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[400]!),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_selectedValue!),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                          buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                          )),
                          dropdownStyleData: DropdownStyleData(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          value: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          items: items.map((String e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _controller,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  setState(() {});
                },
                focusNode: fieldFocus,
                decoration: const InputDecoration(
                  hintText: 'Bạn đang nghĩ gì?',
                  border: InputBorder.none,
                ),
                maxLines: null,
                minLines: 4,
              ),
              if (images.isNotEmpty)
                Container(
                  height: 100.0,
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Image.file(
                              File(images[index].path),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Container(
                                color: Colors.black54,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.blue),
                title: const Text('Ảnh/video'),
                onTap: _pickImages,
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.red),
                title: const Text('Chụp ảnh'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(
                        onPictureTaken: _onPictureTaken,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add, color: Colors.yellow),
                title: const Text('Gắn thẻ người khác'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.music_note, color: Colors.purple),
                title: const Text('Âm nhạc'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: const Text('Thêm vị trí'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.live_tv,
                    color: Colors.red), // Changed the icon for LiveStream
                title: const Text('LiveStream'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LivePage(isHost: true, userID: "Khanh"),
                    ),
                  );
                },
              ),
            ],
          ),
          if (_controller.text.isNotEmpty || images.isNotEmpty)
            CustomButton(
              backgroundColor: Colors.blue,
              content: 'Đăng tin',
              isEnabled: true,
              action: () async {
                await _writePost();
                Navigator.of(context).pop();
              },
              width: MediaQuery.of(context).size.width,
              textStyle: const TextStyle(color: Colors.white),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        titleText: 'Tạo bài viết',
        onBackPress: () => Navigator.of(context).pop(),
        bgcolor: Colors.grey[100],
        colors: Colors.black,
      ),
      body: _body(context),
    );
  }
}
