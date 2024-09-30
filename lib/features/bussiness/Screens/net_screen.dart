import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tomiru_social_flutter/features/Home/widgets/contact_member.dart';
import 'package:tomiru_social_flutter/features/bussiness/Widgets/net_tab.dart'; // Import the new NetTab widget

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
              const SearchBar(),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(28, 28, 35, 22),
                child: UserInfoSection(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                ),
                child: const TabBar(
                  physics: NeverScrollableScrollPhysics(),
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
              const SizedBox(
                height: 400, // Adjust the height as necessary
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: OverviewTab(),
                    ),
                    NetTab(), // Use the separated NetTab widget
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
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 12),
          const StatsSection(),
          const SizedBox(height: 12),
          const IncomeSection(),
          const RecentCustomersSection(
            title: "Khách hàng gần đây",
          ),
          const SizedBox(height: 12),
          ContactWithOthers(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                    padding: const EdgeInsets.symmetric(horizontal: 12),
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
          const SizedBox(width: 21),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
            ),
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.black),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
            ),
            child: IconButton(
              icon: const Icon(Iconsax.menu_1, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String imageUrl = 'assets/images/Oval Copy 6.png';

    return const Row(
      children: [
        // Stack(
        //   clipBehavior: Clip.none,
        //   children: [
        //     // const CircleAvatar(
        //     //   radius: 33.5,
        //     //   backgroundColor: Colors.grey,
        //     //   backgroundImage: AssetImage(imageUrl),
        //     // ),
        //     Positioned(
        //       bottom: 0,
        //       right: 3,
        //       child: Container(
        //         height: 15,
        //         width: 15,
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //           shape: BoxShape.circle,
        //           border: Border.all(color: Colors.white, width: 2.0),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(width: 10),
        // const Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text.rich(
        //       TextSpan(
        //         text: 'Tổng số thành viên F1 giới thiệu: ',
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        //         children: [
        //           TextSpan(
        //             text: '1200',
        //             style: TextStyle(color: Colors.black45),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Text.rich(
        //       TextSpan(
        //         text: 'Tổng số Khách hàng phát sinh: ',
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        //         children: [
        //           TextSpan(
        //             text: '30',
        //             style: TextStyle(color: Colors.black45),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Text.rich(
        //       TextSpan(
        //         text: 'Đang hoạt động: ',
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        //         children: [
        //           TextSpan(
        //             text: '12',
        //             style: TextStyle(color: Colors.black45),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Text.rich(
        //       TextSpan(
        //         text: 'Cần gia hạn phí: ',
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        //         children: [
        //           TextSpan(
        //             text: '12',
        //             style: TextStyle(color: Colors.black45),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
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
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IncomeCard(title: 'F1', value: '5', buttonText: 'Xem cây'),
        SizedBox(height: 22, width: 20),
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

  const IncomeCard(
      {super.key,
      required this.title,
      required this.value,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 118,
      padding: const EdgeInsets.all(16),
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
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(value,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class RecentCustomersSection extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const RecentCustomersSection(
      {super.key, required this.title, this.onPressed});
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