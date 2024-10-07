import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/common/widgets_2/confirmation_dialog_widget.dart';
// import 'package:tomiru_social_flutter/features/bussiness/Screens/transaction_confirmation_screen.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/group/Widgets/cutom_input_event.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/custom_mainbar.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';
import 'package:tomiru_social_flutter/features/bussiness/Screens/tomxu_status_screen.dart';
import 'package:tomiru_social_flutter/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ServiceRegisterForm extends StatefulWidget {
  final String price;
  final String period;
  final String packageName;
  const ServiceRegisterForm(
      {super.key,
      required this.price,
      required this.period,
      required this.packageName});

  @override
  State<ServiceRegisterForm> createState() => _ServiceRegisterFormState();
}

class _ServiceRegisterFormState extends State<ServiceRegisterForm> {
  String? email;
  bool onLoading = false;

  @override
  void initState() {
    super.initState();
    email = Get.find<AuthController>().getUserSelfInfo()?.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onBackPress: () => Navigator.of(context).pop(),
          mainTitle: "Gia hạn gói dịch vụ",
          padding: 0,
          widget: const [],
        ),
        body: Stack(
          children: [
            GetBuilder<BusinessController>(
              builder: (businessController) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInputEventWidget(
                        isEnabled: false,
                        controller: TextEditingController(),
                        title: 'Số lượng cần chuyển',
                        hintText: widget.price,
                        inputType: TextInputType.text,
                        onValueChanged: (value) {},
                      ),
                      const SizedBox(height: 16),
                      CustomInputEventWidget(
                        isEnabled: false,
                        controller: TextEditingController(),
                        title: 'Tên đăng nhập hoặc Email người nhận',
                        hintText: email ?? '',
                        inputType: TextInputType.text,
                        onValueChanged: (value) {},
                      ),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lời nhắn',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Phí GD: 0 TOMXU',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          enabled: false,
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText:
                                'Mã thành viên: XTS!2312\nGói dịch vụ: Gói ${widget.packageName}',
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 54,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed: onLoading
                                ? null
                                : () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ConfirmationDialogWidget(
                                          icon:
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFqOIBwSdnA4WVobBp5UVfFWf7WYJGFzfPTA&s",
                                          title: 'Xác nhận',
                                          description:
                                              "Bạn chắc chắn muốn ${widget.packageName.toLowerCase().contains("extend") ? 'gia hạn' : 'mua'} gói ${widget.packageName}?",
                                          onYesPressed: () => buyPackage(
                                              context,
                                              businessController,
                                              widget.packageName));
                                    }),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Center(
                              child: Text(
                                'Tiếp tục',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if (onLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ),
              ),
          ],
        ));
  }

  void buyPackage(BuildContext context, BusinessController businessController,
      String package) async {
    setState(() {
      onLoading = true;
    });
    try {
      final response = await businessController.buyPackage(package);
      if (!context.mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TomxuStatusScreen(
            isSuccess: response.isSuccess,
          ),
        ),
      );
    } finally {
      setState(() {
        onLoading = false;
      });
    }
  }
}
