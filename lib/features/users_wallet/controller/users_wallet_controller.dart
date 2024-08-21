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

  int _value = 0;
  String _codeOtp = '';
  String _email = '';
  String _message = '';

  int get value => _value;
  String get codeOtp => _codeOtp;
  String get email => _email;
  String get message => _message;

  void updateValue(int newValue) {
    _value = newValue;
  }

  void updateCodeOtp(String newCodeOtp) {
    _codeOtp = newCodeOtp;
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
  }

  void updateMessage(String newMessage) {
    _message = newMessage;
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
  Future<void> sendToken() async {
    SendTokenModel data = SendTokenModel(
      value: _value,
      codeOtp: _codeOtp,
      email: _email,
      message: _message,
    );
    await userWalletServiceInterface.sendToken(data);
  }
}