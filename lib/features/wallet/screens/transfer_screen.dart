import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/models/sendTokenModel.dart';
import '../../../common/widgets_2/custom_text_field_widget.dart';
import '../controllers/wallet_controller.dart';

class TransferScreen extends StatefulWidget {
  final int initialTabIndex;
  final bool? isQrEmail;
  final bool? isQrAll;

  const TransferScreen(
      {super.key,
      this.initialTabIndex = 0,
      this.isQrEmail = false,
      this.isQrAll = false});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final WalletController walletController = Get.find();

  late TextEditingController emailController;
  late TextEditingController valueController;
  late TextEditingController messageController;
  late TextEditingController otpController;

  bool isOTPSent = false;
  int otpCountdown = 120;
  Timer? otpTimer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialTabIndex);

    emailController = TextEditingController();
    valueController = TextEditingController();
    messageController = TextEditingController();
    otpController = TextEditingController();
    walletController.getEmailListLocal();
    if (widget.isQrAll == true) {
      emailController.text = walletController.email;
      valueController.text = walletController.value.toString();
      messageController.text = walletController.message;
    }
    if (widget.isQrEmail == true) {
      emailController.text = walletController.email;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    valueController.dispose();
    messageController.dispose();
    otpController.dispose();
    otpTimer?.cancel();
    walletController.clearController();
    super.dispose();
  }

  void startOtpCountdown() {
    setState(() {
      isOTPSent = true;
      otpCountdown = 60;
    });

    otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        otpCountdown--;
        if (otpCountdown == 0) {
          timer.cancel();
          isOTPSent = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            splashFactory: NoSplash.splashFactory,
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
    return SingleChildScrollView(
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
              walletController.updateValue(int.parse(value));
            },
            inputType: TextInputType.number,
            isAmount: true,
            showTitle: false,
            showBorder: true,
            isEnabled: widget.isQrAll ?? false ? false : true,
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
              walletController.updateEmail(value);
            },
            inputType: TextInputType.emailAddress,
            isEnabled:
                !(widget.isQrAll ?? false) && !(widget.isQrEmail ?? false),
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
            isEnabled: widget.isQrAll ?? false ? false : true,
            onChanged: (value) {
              walletController.updateMessage(value);
            },
            maxLines: 5,
            showTitle: false,
            showBorder: true,
          ),
          const SizedBox(height: 16.0),
          const Text('Xác thực OTP',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldWidget(
                  titleText: 'Xác thực OTP',
                  hintText: 'Nhập OTP',
                  controller: otpController,
                  inputType: TextInputType.number,
                  showTitle: false,
                  showBorder: true,
                ),
              ),
              const SizedBox(width: 8.0),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: isOTPSent
                      ? null
                      : () {
                          walletController.requestOTP();
                          startOtpCountdown();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    isOTPSent ? 'Gửi lại sau $otpCountdown s' : 'Gửi OTP',
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
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
                    value: walletController.isSavedInfo,
                    onChanged: (value) {
                      setState(() {
                        walletController.saveInfoCheckBox(value!);
                      });
                    },
                    activeColor: theme.primaryColor,
                    checkColor: Colors.white,
                    side: BorderSide(color: theme.primaryColor),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    tristate: false,
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
                final sendTokenData = SendTokenModel(
                  value: int.parse(valueController.text),
                  codeOtp: otpController.text,
                  email: emailController.text,
                  message: messageController.text,
                );
                walletController.sendToken(sendTokenData);
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
    return GetBuilder<WalletController>(
      builder: (controller) {
        if (controller.listEmail.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Chưa có thông tin nào trong danh bạ.',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                controller.listEmail.length,
                (index) {
                  final email = controller.listEmail[index];

                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/contact_image.png'),
                    ),
                    title: const Text(
                      'Nguyễn Hữu Kiên',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Stk: 2131231231',
                            style: TextStyle(color: Colors.grey)),
                        Text('Email: $email',
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    trailing: Text(
                      index % 2 == 0 ? 'Khách hàng' : 'Đối tác',
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                    onTap: () {
                      _selectEmailAndSwitchTab(email);
                    },
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  void _selectEmailAndSwitchTab(String email) {
    setState(() {
      emailController.text = email;
      _tabController.animateTo(0);
    });
  }
}
