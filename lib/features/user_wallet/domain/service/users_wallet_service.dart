
import 'package:http/http.dart';
import 'package:tomiru_social_flutter/features/user_wallet/domain/service/users_wallet_service_interface.dart';
import '../models/wallet_history_model.dart';
import '../repositories/users_wallet_repositories_interface.dart';



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



}
