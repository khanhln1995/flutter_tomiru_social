import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Business Screen'),
          backgroundColor: Colors.blue,
        ),
        body: NetScreen(),
      ),
    );
  }
}

class NetScreen extends StatelessWidget {
  const NetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoSection(),
          SizedBox(height: 20),
          TabBarSection(),
          SizedBox(height: 20),
          StatsSection(),
          SizedBox(height: 20),
          IncomeSection(),
          SizedBox(height: 20),
          RecentCustomersSection(),
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

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
            child: const Center(
              child: Text(
                'Tổng quan',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'Mạng lưới',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
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
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.blue)),
          SizedBox(height: 10),
          Text(value,
          style: TextStyle(color: Colors.blue),),
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
        IncomeCard(title: 'F1 (không phải thành viên)', value: '5', buttonText: 'Xem cây'),
        SizedBox(height: 10),
        IncomeCard(title: 'Thu nhập từ hệ thống', value: '105 TOMXU', buttonText: 'Xem chi tiết'),
        SizedBox(height: 10),
        IncomeCard(title: 'pTOMXU', value: '11,172', buttonText: 'Xem chi tiết'),
      ],
    );
  }
}

class IncomeCard extends StatelessWidget {
  final String title;
  final String value;
  final String buttonText;

  IncomeCard({required this.title, required this.value, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey)),
              Text(value, style: TextStyle(color: Colors.blue, fontSize: 20)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}

class RecentCustomersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Khách hàng gần đây', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Xem thêm', style: TextStyle(color: Colors.blue)),
          ],
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomerCard(),
              CustomerCard(),
              CustomerCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(height: 10),
          Text('Vũ Phương Linh', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Khách hàng'),
          Text('28 phút', style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Nhắn tin'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Gọi điện'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
