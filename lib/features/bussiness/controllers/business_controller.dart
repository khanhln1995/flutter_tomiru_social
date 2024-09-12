import 'package:get/get.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/vault_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/wallet_info.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/packages.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/services/business_service_interface.dart';
import 'package:tomiru_social_flutter/common/models/response_model.dart';

class BusinessController extends GetxController implements GetxService {
  final BusinessServiceInterface businessServiceInterface;
  BusinessController({required this.businessServiceInterface}) {
    _notification = businessServiceInterface.isNotificationActive();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _notification = true;
  bool get notification => _notification;

  List<TreeNode>? _treeData;
  List<TreeNode>? get treeData => _treeData;

  TreeResponse? _treeResponse;
  TreeResponse? get treeResponse => _treeResponse;
//
  List<TreeNode>? _treeDataDetail;
  List<TreeNode>? get treeDataDetail => _treeDataDetail;

  TreeResponse? _treeDetailResponse;
  TreeResponse? get treeDetailResponse => _treeDetailResponse;

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

  Future<Packages> getPackages() async {
    return await businessServiceInterface.getPackages();
  }

  Future<ResponseModel> buyPackage(String? packageName) async {
    _isLoading = true;
    update();
    ResponseModel responseModel =
        await businessServiceInterface.buyPackage(packageName);
    _isLoading = false;
    update();
    return responseModel;
  }

  Future fetchTree() async {
    TreeResponse treeResponse =
        await businessServiceInterface.fetchTernaryTree();
    _treeData = treeResponse.trees;
    return treeResponse;
  }

  Future fetchTreeDetail({Map<String, String>? filters}) async {
    TreeResponse treeDetailResponse =
        await businessServiceInterface.fetchTernaryTreeDetail(filters: filters);
    print("Đây là bussiness controller fetch tree detail");
    print(treeDetailResponse);
    _treeDataDetail = treeDetailResponse.trees;
    return treeDetailResponse;
  }

  Future<List<WalletInfo>> getWalletInfoByFilter(
      {Map<String, String>? filters}) async {
    List<WalletInfo> walletInfoList =
        await businessServiceInterface.getWalletInfoByFilter(filters: filters);
    return walletInfoList;
  }
}
