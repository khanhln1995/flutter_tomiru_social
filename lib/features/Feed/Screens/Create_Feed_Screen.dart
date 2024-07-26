import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tomiru_social_flutter/features/camera/screen/camera_screen.dart';
import 'package:tomiru_social_flutter/features/camera/screen/livestream_screen.dart';

import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';
import 'package:tomiru_social_flutter/widgets/ui/customButton.dart';

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
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/kem.jpg'),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tony Nguyen',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
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
                          dropdownColor: Colors.blue[100],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
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
                          LivePage(isHost: true, userID: "Lam"),
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
              action: () {},
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
        widget: fieldFocus.hasFocus
            ? [TextButton(onPressed: () {}, child: const Text('OK'))]
            : [],
      ),
      body: _body(context),
    );
  }
}
