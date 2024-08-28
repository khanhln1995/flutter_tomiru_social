import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tomiru_social_flutter/features/Home/widgets/contact_member.dart';
import 'package:tomiru_social_flutter/features/tree/controller/tree_controller.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:tomiru_social_flutter/features/tree/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/tree/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/tree/domain/models/user_model.dart';

class NetScreen extends StatefulWidget {
  const NetScreen({super.key});

  @override
  State<NetScreen> createState() => _NetScreenState();
}

class _NetScreenState extends State<NetScreen> {
  late Future<TreeResponse> _treeFuture;
  String? avatar;

  @override
  void initState() {
    super.initState();
    _treeFuture = getTernaryTree();
    avatar = Get.find<AuthController>().getUserSelfInfo()?.avatar ?? '';
  }

  Future<TreeResponse> getTernaryTree() async {
    return await Get.find<TreeBusinessController>().fetchTree();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: FutureBuilder<TreeResponse>(
          future: _treeFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBar(),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 28, 35, 22),
                      child: UserInfoSection(avatar: avatar ?? ''),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                      ),
                      child: const TabBar(
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 3.0, color: Colors.blue),
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
                      height: 400,
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: OverviewTab(treeResponse: snapshot.data!),
                          ),
                          NetTab(avatar: avatar!),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
  final TreeResponse treeResponse;

  const OverviewTab({super.key, required this.treeResponse});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: StatsSection(
                  active: treeResponse.f1.length,
                  inactive: treeResponse.f1NotMember.length)),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IncomeSection(
                f1notmems: treeResponse.f1NotMember.length,
                tomxu: treeResponse.incomeXU != null
                    ? double.parse(treeResponse.incomeXU).toInt()
                    : 0,
                ptomxu: treeResponse.incomePXU != null
                    ? double.parse(treeResponse.incomePXU).toInt()
                    : 0),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RecentCustomersSection(
                title: "Khách hàng gần đây",
              )),
          const SizedBox(height: 8.0),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ContactWithOthers()),
        ],
      ),
    );
  }
}

class NetTab extends StatefulWidget {
  final String avatar;
  const NetTab({super.key, required this.avatar});
  @override
  State<NetTab> createState() => _NetTabState();
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cây sinh lời", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cây giới thiệu",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              )
            ]),
            const SizedBox(height: 12),
            Expanded(
              child: TreeView<String>(
                treeController: treeController,
                nodeBuilder: (BuildContext context, TreeEntry<String> entry) {
                  return TreeIndentation(
                    entry: entry,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: entry.level *
                                5), // Adjust indentation based on level
                        if (entry.level > 0) ...[
                          CircleAvatar(
                            backgroundImage: NetworkImage(widget.avatar),
                            radius: entry.level == 1
                                ? 20
                                : (entry.level == 2 ? 15 : 10),
                          ),
                          SizedBox(width: 8),
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.node,
                              style: TextStyle(
                                fontWeight: entry.level == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: entry.level == 0
                                    ? 18
                                    : (entry.level == 1 ? 16 : 14),
                              ),
                            ),
                            if (entry.node == 'Nguyễn Hữu Kiên')
                              Text(
                                'Gói kinh doanh',
                                style: TextStyle(
                                  fontSize: entry.level == 0
                                      ? 16
                                      : (entry.level == 1 ? 14 : 12),
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
  final String avatar;
  const UserInfoSection({super.key, required this.avatar});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 33.5,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(avatar),
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
        const SizedBox(width: 10),
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
  final int active;
  final int inactive;
  const StatsSection({super.key, required this.active, required this.inactive});
  @override
  Widget build(BuildContext context) {
    final sum = active + inactive;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StatCard(
            title: 'Số lượng: ',
            value: sum > 10 && sum != 0 ? '$sum' : '0$sum'),
        const SizedBox(width: 18),
        StatCard(
            title: 'Đang hoạt động: ',
            value: active > 10 && active != 0 ? '$active' : '0$active'),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.blue)),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class IncomeSection extends StatelessWidget {
  final int f1notmems;
  final int tomxu;
  final int ptomxu;
  const IncomeSection(
      {super.key,
      required this.f1notmems,
      required this.ptomxu,
      required this.tomxu});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IncomeCard(
            title: 'F1 (không phải thành viên)',
            value: '$f1notmems',
            buttonText: 'Xem cây'),
        const SizedBox(height: 22),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Thu nhập từ hệ thống",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        IncomeCard(title: 'TOMXU', value: '$tomxu', buttonText: 'Xem chi tiết'),
        const SizedBox(height: 12),
        IncomeCard(
            title: 'pTOMXU', value: '$ptomxu', buttonText: 'Xem chi tiết'),
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
