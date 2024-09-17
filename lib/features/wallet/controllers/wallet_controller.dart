import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:tomiru_social_flutter/features/wallet/domain/models/sendTokenModel.dart';
import '../domain/models/wallet_history_model.dart';
import '../domain/services/wallet_service_interface.dart';

class WalletController extends GetxController implements GetxService {
  final WalletServiceInterface walletServiceInterface;
  WalletController({required this.walletServiceInterface}) {
    fetchWalletHistory();
  }

  int _walletPage = 1;
  int _value = 0;
  String _codeOtp = '';
  String _email = '';
  String _message = '';
  List<String> _listEmail = [];
  bool _isSavedInfo = false;

  int get walletPage => _walletPage;
  int get value => _value;
  String get codeOtp => _codeOtp;
  String get email => _email;
  String get message => _message;
  List<String> get listEmail => _listEmail;
  bool get isSavedInfo => _isSavedInfo;

  void saveInfoCheckBox(bool type) {
    _isSavedInfo = type;
  }

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
    await walletServiceInterface.fetchWalletHistory();
    getWalletHistoryLocal();
  }

  void getWalletHistoryLocal() async {
    final response = await walletServiceInterface.getWalletHistoryLocal();
    _walletHistory = response;
  }

  Future<List<WalletHistoryModel>> fetchWalletHistoryByDate() async {
    return await walletServiceInterface.fetchWalletHistoryByDate(_walletPage.toString());
  }

  void updateWalletPage(int page) {
    _walletPage = page;
    fetchWalletHistoryByDate();
    update();
  }

  void resetWalletPage() {
    _walletPage = 1;
    update();
  }

  Future usersCheckin() async {
    await walletServiceInterface.userCheckin();
  }

  Future requestOTP() async {
    await walletServiceInterface.requestOTP();
  }

  Future sendToken(SendTokenModel data) async {
    await walletServiceInterface.sendToken(data);
  }

  void saveInfoLocal(String email) {
    walletServiceInterface.saveInfoLocal(email);
  }

  void getEmailListLocal() async {
    final res = await walletServiceInterface.getEmailListLocal();
    _listEmail = res;
  }

  void clearController() {
    _value = 0;
    _codeOtp = '';
    _email = '';
    _message = '';
    _listEmail = [];
    _isSavedInfo = false;
  }
}
