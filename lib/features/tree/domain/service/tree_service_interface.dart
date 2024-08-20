
import '../models/tree_response_model.dart';

abstract class TreeServiceInterface {
  Future<TreeResponse> fetchTernaryTree();
}
