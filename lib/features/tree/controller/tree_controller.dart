import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../domain/service/tree_service_interface.dart';
import 'package:tomiru_social_flutter/features/tree/domain/models/tree_response_model.dart';

class TreeBusinessController extends GetxController implements GetxService {
  final TreeServiceInterface treeServiceInterface;
  TreeBusinessController({required this.treeServiceInterface}) {
    fetchTree();
  }



  Future<TreeResponse> fetchTree() async {
    return treeServiceInterface.fetchTernaryTree();
  }


}