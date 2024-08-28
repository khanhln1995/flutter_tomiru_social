import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tomiru_social_flutter/common/widgets/ui/customAppBar.dart';
import 'package:tomiru_social_flutter/features/bussiness/controllers/business_controller.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';

class HistoryMember extends StatefulWidget {
  @override
  _HistoryMemberState createState() => _HistoryMemberState();
}

class _HistoryMemberState extends State<HistoryMember> {
  List<WalletInfo> incomeList = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    fetchWalletInfo();

    // Lắng nghe sự kiện cuộn
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchMoreWalletInfo();
      }
    });
  }

  Future<void> fetchWalletInfo() async {
    setState(() {
      _isLoading = true;
    });
    List<WalletInfo> income =
        await Get.find<BusinessController>().getWalletInfo();
    setState(() {
      incomeList.addAll(income);
      _isLoading = false;
    });
  }

  // Hàm để tải thêm dữ liệu
  Future<void> fetchMoreWalletInfo() async {
    if (_isLoading) return; // Kiểm tra nếu đang tải thì không tải thêm

    setState(() {
      _isLoading = true;
      _page += 1; // Tăng trang hiện tại
    });

    List<WalletInfo> moreIncome =
        await Get.find<BusinessController>().getWalletInfo();

    setState(() {
      incomeList.addAll(moreIncome);
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Hủy lắng nghe khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Lịch sử thành viên",
        onBackPress: () {},
        bgcolor: Colors.white,
        colors: Colors.black,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildTransactionList("Tháng 5, 2024", incomeList),
                  const Divider(thickness: 3),
                  _buildTransactionList("Tháng 4, 2024", incomeList),
                  const Divider(thickness: 3),
                  _buildTransactionList("Tháng 3, 2024", incomeList),
                  const Divider(thickness: 3),
                ],
              ),
            ),
            if (_isLoading) // Hiển thị vòng tròn loading khi tải thêm dữ liệu
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTransactionList(String title, List<WalletInfo> incomeList) {
  return Column(
    children: [
      ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: null,
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: incomeList.length,
        itemBuilder: (context, index) {
          int preBalance = incomeList[index].preBalance;
          int postBalance = incomeList[index].postBalance;
          String valuePrefix = postBalance >= preBalance ? "+" : "-";
          DateTime createdAtDateTime =
              DateTime.fromMillisecondsSinceEpoch(incomeList[index].createdAt);
          String formattedDate =
              DateFormat('dd/MM/yyyy').format(createdAtDateTime);
          String formattedTime =
              DateFormat('HH:mm:ss').format(createdAtDateTime);
          return Column(
            children: [
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                title: Text(incomeList[index].message),
                subtitle: Text('$formattedDate - $formattedTime'),
                trailing: Column(
                  children: [
                    Text("$valuePrefix ${incomeList[index].value}"),
                    Text(
                      ' ${incomeList[index].status}',
                      style: TextStyle(
                        color: incomeList[index].status == 'failed'
                            ? Colors.red
                            : Colors.green,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}
