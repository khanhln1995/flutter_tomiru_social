
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:tomiru_social_flutter/features/users_wallet/domain/service/users_wallet_service_interface.dart';
import '../models/sendTokenModel.dart';
import '../models/wallet_history_model.dart';
import '../repositories/users_wallet_repositories_interface.dart';
import 'package:tomiru_social_flutter/common/widgets_2/custom_snackbar_widget.dart';


class UsersWalletService implements UsersWalletServiceInterface {
  final UsersWalletRepositoryInterface usersWalletRepositoryInterface;
  UsersWalletService({required this.usersWalletRepositoryInterface});

  @override
  Future<List<WalletHistoryModel>> fetchWalletHistory()async {
   return await usersWalletRepositoryInterface.fetchWalletHistory();
  }
  @override
  Future<List<WalletHistoryModel>> getWalletHistoryLocal()async {
    return await usersWalletRepositoryInterface.getWalletHistoryLocal();
  }

  @override
  Future<void> userCheckin()async {
      String response = await usersWalletRepositoryInterface.userCheckin();
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print(response);
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  }

  @override
  Future<void> sendTokenOTP()async {
    Response response = await usersWalletRepositoryInterface.sendTokenOTP();
    if (response.statusCode == 200||response.statusCode == 201) {
      showCustomSnackBar('send OTP success'.tr,isError:false);
    }else{
      showCustomSnackBar(response.body['error']['message']);
    }
  }

  @override
  Future<void> sendToken(SendTokenModel data)async {
    Response response = await usersWalletRepositoryInterface.sendToken(data);
    if (response.statusCode == 200||response.statusCode == 201) {
      showCustomSnackBar('send success'.tr,isError:false);
    }else{
      showCustomSnackBar(response.body['error']['message']);
    }
  }


}
