import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import '../domain/models/sendTokenModel.dart';
import '../domain/models/wallet_history_model.dart';
import '../domain/service/users_wallet_service_interface.dart';

class UsersWalletController extends GetxController implements GetxService {
  final UsersWalletServiceInterface userWalletServiceInterface;
  UsersWalletController({required this.userWalletServiceInterface}) {
    fetchWalletHistory();
  }

  List<WalletHistoryModel> _walletHistory = [];

  List<WalletHistoryModel> get walletHistory => _walletHistory;

  void fetchWalletHistory() async {
    await userWalletServiceInterface.fetchWalletHistory();
    getWalletHistoryLocal();
  }

  void getWalletHistoryLocal() async {
   final response = await userWalletServiceInterface.getWalletHistoryLocal();
   _walletHistory = response;
  }

Future usersCheckin()async{
   await userWalletServiceInterface.userCheckin();
}
  Future sendTokenOTP()async{
    await userWalletServiceInterface.sendTokenOTP();
  }
  Future sendToken()async{
    SendTokenModel data = SendTokenModel(
      value: 123,
      codeOtp: '306399',
      email: 'system@gmail.com',
      message: '123',
    );
    await userWalletServiceInterface.sendToken(data);
  }
}