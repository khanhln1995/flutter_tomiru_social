




import 'package:tomiru_social_flutter/features/tree/domain/models/tree_response_model.dart';
import 'package:tomiru_social_flutter/features/tree/domain/service/tree_service_interface.dart';

import '../repositories/tree_repositories_interface.dart';

class TreeService implements TreeServiceInterface {
  final TreeRepositoryInterface treeRepositoryInterface;
  TreeService({required this.treeRepositoryInterface});

  @override
  Future<TreeResponse> fetchTernaryTree()async {
    return await treeRepositoryInterface.fetchTernaryTree();
  }




}
