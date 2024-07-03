import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tomiru_social_flutter/widgets/ui/customAppBar.dart';
import 'package:tomiru_social_flutter/widgets/ui/customButton.dart';
import 'package:tomiru_social_flutter/widgets/global/imagePicker.dart';

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
  TextEditingController _controller = TextEditingController();

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

  Widget _body(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/kem.jpg'),
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tony Nguyen',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
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
                                fontWeight: FontWeight.bold),
                            buttonStyleData: ButtonStyleData(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            dropdownStyleData: DropdownStyleData(
                                maxHeight: MediaQuery.of(context).size.height,
                                decoration:
                                    BoxDecoration(color: Colors.white))),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _controller,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                focusNode: fieldFocus,
                decoration: InputDecoration(
                  hintText: 'Bạn đang nghĩ gì?',
                  border: InputBorder.none,
                ),
                maxLines: null,
                minLines: 4,
                // onTap: () => fieldFocus.requestFocus(),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.photo, color: Colors.blue),
                      title: Text('Ảnh/video'),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                GalleryImage(),
                            transitionDuration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.camera_alt, color: Colors.red),
                      title: Text('Chụp ảnh'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.person_add, color: Colors.yellow),
                      title: Text('Gắn thẻ người khác'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note, color: Colors.purple),
                      title: Text('Âm nhạc'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.red),
                      title: Text('Thêm vị trí'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ]),
            if (_controller.text.isNotEmpty)
              CustomButton(
                  content: 'Đăng tin',
                  isEnabled: true,
                  action: () {},
                  width: MediaQuery.of(context).size.width,
                  textStyle: TextStyle(color: Colors.white))
          ],
        ));
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
