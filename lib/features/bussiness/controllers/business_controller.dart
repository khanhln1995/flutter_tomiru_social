import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/packages.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service_interface.dart';

class BusinessController extends GetxController implements GetxService {
  final BusinessServiceInterface businessServiceInterface;
  BusinessController({required this.businessServiceInterface}) {
    _notification = businessServiceInterface.isNotificationActive();
  }

  bool _notification = true;
  bool get notification => _notification;

  List<TreeNode>? _treeData;
  List<TreeNode>? get treeData => _treeData;

  TreeResponse? _treeResponse;
  TreeResponse? get treeResponse => _treeResponse;

  Future<List<VaultInfo>> getVaultInfo() async {
    List<VaultInfo> vaultInfoList =
        await businessServiceInterface.getVaultInfo();
    return vaultInfoList;
  }

  Future<List<WalletInfo>> getWalletInfo() async {
    List<WalletInfo> walletInfoList =
        await businessServiceInterface.getWalletInfo();
    return walletInfoList;
  }

  Future<List<PackagesAvailable>> getPackages() async {
    List<PackagesAvailable> packagesAvailableList =
        await businessServiceInterface.getPackages();
    print('object: $packagesAvailableList');
    return packagesAvailableList;
  }

  Future fetchTree() async {
    TreeResponse treeResponse =
        await businessServiceInterface.fetchTernaryTree();
    _treeData = treeResponse.trees;
    return treeResponse;
  }
}
