import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Group_Page.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Invite_Members_Screen.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/custom_button_1.dart';
import 'package:tomiru_social_flutter/features/Group_Screen/Widgets/cutom_input_event.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final List<Member> members = [
    const Member(name: 'Anh Cường', avatar: 'assets/images/Ellipse 10.png'),
    const Member(
        name: 'Phạm Đình Chương', avatar: 'assets/images/Ellipse 10 (1).png'),
    const Member(
        name: 'Bình Cenhomes', avatar: 'assets/images/Ellipse 10 (2).png'),
    const Member(
        name: 'Lan Anh Cường', avatar: 'assets/images/Ellipse 10 (3).png'),
    const Member(
        name: 'Mạnh Cường', avatar: 'assets/images/Ellipse 10 (4).png'),
    const Member(name: 'Bình Cenhomes', avatar: 'assets/images/Ellipse 11.png'),
    const Member(name: 'Lan Anh Cường', avatar: 'assets/images/Ellipse 12.png'),
  ];
  final List<bool> invited = List.generate(7, (index) => false);
  String? selectedOption = 'link';
  TextEditingController linkController = TextEditingController();
  String? selectedLocation;
  TextEditingController locationController = TextEditingController();
  bool inviteAllMembers = false;
  final _formKey = GlobalKey<FormState>(); // Khởi tạo GlobalKey cho Form

//!
  @override
  void dispose() {
    linkController.dispose();
    super.dispose();
  }

  String? _validateLink(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập liên kết';
    }

    // Sử dụng biểu thức chính quy (Regular Expression) để kiểm tra định dạng URL
    // Biểu thức này có thể cần được điều chỉnh để phù hợp với yêu cầu của bạn
    const urlPattern =
        r'(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?';
    final regExp = RegExp(urlPattern, caseSensitive: false);
    if (!regExp.hasMatch(value)) {
      return 'Liên kết không hợp lệ';
    }

    return null; // Trả về null nếu không có lỗi
  }
//!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.black,
          iconSize: 30,
          onPressed: () {
            // Close page
            Navigator.of(context).pop();
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.grey,
            height: 0.5,
            thickness: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/event_manager.png', // Path to image
                fit: BoxFit.cover,
              ),
              CustomInputEventWidget(
                controller: TextEditingController(),
                title: 'Tên sự kiện',
                hintText: "Đặt tên sự kiện",
                inputType: TextInputType.text,
                onValueChanged: (value) {
                  // Change event name
                },
              ),
              const SizedBox(height: 20),
              CustomInputEventWidget(
                controller: TextEditingController(),
                title: 'Ngày và giờ bắt đầu',
                inputType: TextInputType.text,
                onValueChanged: (value) {
                  // Change event start date and time
                },
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomButtonTime(
                  text: "Thêm thời gian kết thúc",
                  onPressed: () {
                    // Add end time
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return _buildBottomSheet(context);
                          },
                        );
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.grey[400], fontSize: 14),
                            hintText: "Đây là sự kiện trực tiếp hay trên mạng",
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        "Ai có thể nhìn thấy sự kiện này",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 14),
                        hintText: "Nhóm Tomiru",
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.grey[300]!, width: 1.0),
                        ),
                      ),
                      readOnly: true, // Make the TextField read-only
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        child: const Text(
                          'Mời những thành viên nào ?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return _buildBottomSheetForGroup(context);
                            },
                          );
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mời tất cả thành viên nhóm',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Checkbox(
                      value: inviteAllMembers,
                      onChanged: (bool? value) {
                        setState(() {
                          inviteAllMembers = value!;
                          invited.fillRange(0, invited.length, value); 
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mô tả về sự kiện",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: Colors.grey[400], fontSize: 14),
                        hintText: "Hãy mô tả chi tiết về sự kiện",
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1.0,
                          ),
                        ),
                      ),
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 374,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GroupPage(
                            initialPageIndex: 2,
                            showEventExist: true), // Truyền showEventExist
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFF6891F), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6.0), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Tạo sự kiện',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildBottomSheet(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const TabBar(
            tabs: [
              Tab(text: "Gặp mặt trực tiếp"),
              Tab(text: "Trên mạng"),
            ],
          ),
          SizedBox(
            height: 500,
            child: TabBarView(
              children: [
                // Tab "Gặp mặt trực tiếp"
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: SizedBox(
                        width: 374,
                        height: 38,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Nhập vị trí',
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: const Color(0xFFF5F5F5),
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                          _buildLocationList(), // Thay bằng widget hiển thị danh sách vị trí của bạn
                    ),
                  ],
                ),

                // Tab "Trên mạng"
                StatefulBuilder(
                  // Bọc toàn bộ nội dung TabBarView trong StatefulBuilder
                  builder: (BuildContext context, StateSetter setState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              _buildLinkOption(
                                  setState), // Widget tùy chọn "Liên kết ngoài"
                              const SizedBox(height: 20),
                              _buildOtherOption(
                                  setState), // Widget tùy chọn "Khác"
                            ],
                          ),
                          SizedBox(
                            width: 374,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                // Xử lý khi nhấn nút "Xong"
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF6891F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                              child: const Text(
                                'Xong',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildLinkOption(StateSetter setState) {

    return Column(
      // Thay Row bằng Column
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset("assets/images/Ellipse 10.png", width: 44),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Liên kết ngoài",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Thêm liên kết để mọi người có thể truy cập vào đâu khi sự kiện bắt đầu",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: 'link',
              groupValue: selectedOption,
              activeColor: const Color(0xFFF6891F),
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value;
                  linkController.clear();
                });
              },
            ),
          ],
        ),
        if (selectedOption == 'link') ...[
          const SizedBox(height: 20),
          Form(
            // Thêm Form để quản lý xác thực
            key: _formKey, // Gán GlobalKey cho Form
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              controller: linkController,
              decoration: InputDecoration(
                
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                hintText: "Nhập liên kết tại đây",
                border: const OutlineInputBorder(),
                errorBorder:const OutlineInputBorder(
                  // Thêm errorBorder cho viền đỏ
                  borderSide: BorderSide(color: Colors.red),
                ),
                contentPadding: const EdgeInsets.all(10),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                suffixIcon: _validateLink(linkController.text) != null ? const Icon(Icons.warning, color: Colors.red) : null,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập liên kết';
                }
                // Kiểm tra định dạng URL (bạn có thể tùy chỉnh regex này)
                const urlPattern =
                    r'(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:,.;]*)?';
                final regExp = RegExp(urlPattern, caseSensitive: false);
                if (!regExp.hasMatch(value)) {
                  return 'Liên kết không hợp lệ';
                }
                return null; // Trả về null nếu không có lỗi
              },
            ),
          ),
        ],
      ],
    );
  }


  Widget _buildOtherOption(StateSetter setState) {
    return Row(
      children: [
        Image.asset("assets/images/Ellipse 10.png", width: 44),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Khác",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Thêm hướng dẫn vào phần chi tiết sự kiện để chỉ rõ cách tham gia",
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
        Radio<String>(
          value: 'other',
          groupValue: selectedOption,
          activeColor: const Color(0xFFF6891F),
          onChanged: (String? value) {
            setState(() {
              selectedOption = value;
              linkController.clear();
            });
          },
        ),
      ],
    );
  }
  Widget _buildBottomSheetForGroup(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Mời mọi người',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 374,
              height: 38,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm thành viên để mời',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: const Color(0xF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: members.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(members[index].avatar),
                  ),
                  title: Text(
                    members[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        // invited[index] = true;
                        invited[index] = !invited[index];
                        inviteAllMembers=invited.every((element) => element);
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Icon(invited[index] ? Icons.check : Icons.add,
                            size: 18),
                        const SizedBox(width: 4),
                        Text(
                          invited[index] ? 'Đã mời' : 'Mời',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: invited[index] ? Colors.black : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  indent: 80, // Indent to align with the avatar
                  endIndent:
                      10, // End indent to leave space before the trailing button
                  color: Colors.grey[200],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationList() {
    List<String> locations =
        List<String>.generate(8, (index) => 'Tô Hiệu, Hà Đông, Hà Nội');
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedLocation =
                  locations[index]; // Lưu địa điểm đã chọn vào biến
              locationController.text =
                  selectedLocation!; // Hiển thị địa điểm đã chọn vào ô TextField
            });
            Navigator.pop(context); // Đóng bottom sheet
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
            ),
            title: Text(
              locations[index],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              locations[index],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
