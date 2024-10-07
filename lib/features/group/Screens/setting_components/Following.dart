import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/features/group/Widgets/sort_group.dart';
import "package:tomiru_social_flutter/features/Friends/Widgets/Open_Bottom_Sheet.dart";

class Following extends StatefulWidget {
  const Following({super.key});
  @override
  _FollowingState createState() => _FollowingState();
}

class Member {
  final String name;
  final String avatar;
  final String sub;
  const Member({required this.name, required this.avatar, required this.sub});
}

class _FollowingState extends State<Following> {
  final paddingTextInTextField = 14.0;
  final List<Member> members = [
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 10.png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 10 (1).png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 10 (2).png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 10 (3).png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 10 (4).png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 11.png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 12.png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 12.png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 12.png',
        sub: "Truy cập cuối: 2 năm trước"),
    const Member(
        name: 'Hội Saler Sun Tower',
        avatar: 'assets/images/Ellipse 12.png',
        sub: "Truy cập cuối: 2 năm trước"),
  ];
  final List<bool> isFollow = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text("Theo dõi",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 2,
            color: Colors.grey[200],
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 16),
                FractionallySizedBox(
                  widthFactor: 0.9, // Chiều rộng 90% màn hình
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 128, 126, 126),
                            ),
                            hintText: "Tìm tên",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 128, 126, 126),
                            ),
                            contentPadding: EdgeInsets.only(
                              top: paddingTextInTextField,
                              bottom: paddingTextInTextField,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 245, 244, 244),
                          ),
                        ),
                      ),
                      SizedBox(
                        width:
                            40, // Đặt chiều rộng để có không gian phù hợp cho nút
                        child: TextButton(
                          onPressed: () => OpenBottomSheet(
                            context,
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Sắp xếp nhóm",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SortGroup(),
                          ),
                          child: const Icon(
                            Icons.swap_vert,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  itemCount: members.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable internal scrolling
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      onTap: () {},
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(members[index].avatar),
                      ),
                      title: Text(
                        members[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        members[index].sub,
                        style: TextStyle(color: Colors.grey[600]),
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
                            isFollow[index] = !isFollow[index];
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isFollow[index] == true
                                  ? "Bỏ theo dõi"
                                  : "Theo dõi",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return FractionallySizedBox(
                      widthFactor: 0.9, // Chiếm 80% chiều rộng của màn hình
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey[300],
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
}
