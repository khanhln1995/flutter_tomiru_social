import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  final int initialTabIndex;

  const TransferScreen({super.key, this.initialTabIndex = 0});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Chuyển Tomxu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Người nhận mới'),
              Tab(text: 'Danh bạ đã lưu'),
            ],
            indicatorColor: theme.primaryColor,
            labelColor: theme.primaryColor,
            unselectedLabelColor: theme.unselectedWidgetColor,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNewReceiverTab(theme),
          _buildSavedContactsTab(),
        ],
      ),
    );
  }

  Widget _buildNewReceiverTab(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Số lượng', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Số TOMXU',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('Tên đăng nhập hoặc Email người nhận',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tên hoặc Email người nhận',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('Ghi chú', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          const TextField(
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập ghi chú',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Phí GD: 0 TOMXU',
                  style: TextStyle(color: Colors.grey)),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  const Text('Lưu vào danh bạ',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child:
                  const Text('Xác nhận', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedContactsTab() {
    final contacts = List.generate(
        10,
        (index) => {
              'name': 'Nguyễn Hữu Kiên',
              'account': '2131231231',
              'email': 'kien@gmail.com',
              'role': index % 2 == 0 ? 'Khách hàng' : 'Đối tác',
            });

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/contact_image.png'), // Replace with your contact image path
          ),
          title: Text(
            contact['name']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Stk: ${contact['account']}',
                  style: const TextStyle(color: Colors.grey)),
              Text('Email: ${contact['email']}',
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
          trailing: Text(
            contact['role']!,
            style: const TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        );
      },
    );
  }
}
