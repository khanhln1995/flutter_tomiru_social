import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets_2/custom_text_field_widget.dart';
import '../../users_wallet/controller/users_wallet_controller.dart';

class TransferScreen extends StatefulWidget {
  final int initialTabIndex;
  final bool? isQrEmail;
  final bool? isQrAll;

  TransferScreen({super.key, this.initialTabIndex = 0, this.isQrEmail = false, this.isQrAll = false});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final UsersWalletController usersWalletController = Get.find();
  late TextEditingController emailController;
  late TextEditingController valueController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialTabIndex);

    // Kiểm tra isQrEmail và lấy giá trị email từ controller nếu cần
    emailController = TextEditingController();
    valueController = TextEditingController();
    messageController = TextEditingController();
    if (widget.isQrAll == true) {
      emailController.text = usersWalletController.email;
      valueController.text = usersWalletController.value.toString();
      messageController.text = usersWalletController.message;
    }
    if (widget.isQrEmail == true) {
      emailController.text = usersWalletController.email;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    valueController.dispose();
    messageController.dispose();
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
          CustomTextFieldWidget(
            titleText: 'Số lượng',
            hintText: 'Số TOMXU',
            controller: valueController,
            onChanged: (value) {
              usersWalletController.updateValue(int.parse(value));
            },
            inputType: TextInputType.number,
            isAmount: true,
            showTitle: false,
            showBorder: true,
            isEnabled:widget.isQrAll ?? false ? false : true,
          ),
          const SizedBox(height: 16.0),
          const Text('Tên đăng nhập hoặc Email người nhận',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          CustomTextFieldWidget(
            titleText: 'Tên đăng nhập hoặc Email người nhận',
            hintText: 'Tên hoặc Email người nhận',
            controller: emailController,
            onChanged: (value) {
              usersWalletController.updateEmail(value);
            },
            inputType: TextInputType.emailAddress,
            isEnabled:!(widget.isQrAll ?? false) && !(widget.isQrEmail ?? false),
            showTitle: false,
            showBorder: true,
          ),
          const SizedBox(height: 16.0),
          const Text('Ghi chú', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          CustomTextFieldWidget(
            titleText: 'Ghi chú',
            hintText: 'Nhập ghi chú',
            controller: messageController,
            isEnabled:widget.isQrAll ?? false ? false : true,
            onChanged: (value) {
              usersWalletController.updateMessage(value);
            },
            maxLines: 5,
            showTitle: false,
            showBorder: true,

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
              onPressed: () {
                usersWalletController.sendToken();
              },
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
