import 'package:comment_tree/comment_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tomiru_social_flutter/features/Home/widgets/contact_member.dart';

class NetScreen extends StatelessWidget {
  const NetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 35, 22),
                child: UserInfoSection(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                ),
                child: const TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0, color: Colors.blue),
                  ),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "Tổng quan",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Mạng lưới",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 400, // Adjust the height as necessary
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: OverviewTab(),
                    ),
                    NetTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Expanded(
        child: Column(
          children: [
            SizedBox(height: 12),
            StatsSection(),
            SizedBox(height: 12),
            IncomeSection(),
            RecentCustomersSection(
              title: "Khách hàng gần đây",
            ),
            SizedBox(height: 12),
            ContactWithOthers(),
          ],
        ),
      ),
    );
  }
}

class NetTab extends StatefulWidget {
  @override
  _NetTabState createState() => _NetTabState();
}

class _NetTabState extends State<NetTab> {
  late final TreeController<String> treeController;

  @override
  void initState() {
    super.initState();
    treeController = TreeController<String>(
      roots: ['Danh sách F1', 'Danh sách F2'],
      childrenProvider: (String node) {
        if (node == 'Danh sách F1' || node == 'Danh sách F2') {
          return ['Nguyễn Hữu Kiên'];
        } else if (node == 'Nguyễn Hữu Kiên') {
          return ['Nguyễn Văn A', 'Nguyễn Văn A'];
        } else if (node == 'Nguyễn Văn A') {
          return ['Nguyễn Văn B', 'Nguyễn Văn B', 'Nguyễn Văn B'];
        }
        return [];
      },
    );

    // Expand all nodes initially
    treeController.expandAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cây sinh lời", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cây giới thiệu", style: TextStyle(color: Colors.black)),
                  ],
                ),
              )
            ]),
            SizedBox(height: 12),
            Expanded(
              child: TreeView<String>(
                treeController: treeController,
                nodeBuilder: (BuildContext context, TreeEntry<String> entry) {
                  return TreeIndentation(
                    entry: entry,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: entry.level * 20), // Adjust indentation based on level
                        if (entry.level > 0) ...[
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/Ellipse 17.png'),
                            radius: entry.level == 1 ? 20 : (entry.level == 2 ? 15 : 10),
                          ),
                          SizedBox(width: 8),
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.node,
                              style: TextStyle(
                                fontWeight: entry.level == 0 ? FontWeight.bold : FontWeight.normal,
                                fontSize: entry.level == 0 ? 18 : (entry.level == 1 ? 16 : 14),
                              ),
                            ),
                            if (entry.node == 'Nguyễn Hữu Kiên')
                              Text(
                                'Gói kinh doanh',
                                style: TextStyle(
                                  fontSize: entry.level == 0 ? 16 : (entry.level == 1 ? 14 : 12),
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Iconsax.search_normal, color: Colors.grey[600]),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm thông tin hội viên',
                        hintStyle:
                            TextStyle(color: Colors.grey[500], fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 21),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
            ),
            child: IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 12),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
            ),
            child: IconButton(
              icon: Icon(Iconsax.menu_1, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String imageUrl = 'assets/images/Oval Copy 6.png';

    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 33.5,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(imageUrl),
            ),
            Positioned(
              bottom: 0,
              right: 3,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: 'Tổng số thành viên F1 giới thiệu: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                children: [
                  TextSpan(
                    text: '1200',
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Tổng số Khách hàng phát sinh: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                children: [
                  TextSpan(
                    text: '30',
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Đang hoạt động: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                children: [
                  TextSpan(
                    text: '12',
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Cần gia hạn phí: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                children: [
                  TextSpan(
                    text: '12',
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StatCard(title: 'Số lượng: ', value: '120'),
        SizedBox(width: 18),
        StatCard(title: 'Đang hoạt động: ', value: '03'),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.blue)),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class IncomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IncomeCard(
            title: 'F1 (không phải thành viên)',
            value: '5',
            buttonText: 'Xem cây'),
        SizedBox(height: 22),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Thu nhập từ hệ thống",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 12),
        IncomeCard(title: 'TOMXU', value: '105 ', buttonText: 'Xem chi tiết'),
        SizedBox(height: 12),
        IncomeCard(
            title: 'pTOMXU', value: '11,172', buttonText: 'Xem chi tiết'),
      ],
    );
  }
}

class IncomeCard extends StatelessWidget {
  final String title;
  final String value;
  final String buttonText;

  IncomeCard(
      {required this.title, required this.value, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 118,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(value,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              )),
        ],
      ),
    );
  }
}

class RecentCustomersSection extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  RecentCustomersSection({required this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: onPressed,
            child: const Text("Xem thêm",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
