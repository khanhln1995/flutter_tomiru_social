import 'package:tomiru_social_flutter/interface/repository_interface.dart';

import '../models/tree_response_model.dart';



abstract class TreeRepositoryInterface extends RepositoryInterface {

  Future<TreeResponse> fetchTernaryTree();

}
