import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../domain/service/tree_service_interface.dart';


class TreeController extends GetxController implements GetxService {
  final TreeServiceInterface treeServiceInterface;
  TreeController({required this.treeServiceInterface}) {
    fetchTree();
  }



  void fetchTree() async {
    await treeServiceInterface.fetchTernaryTree();
  }


}