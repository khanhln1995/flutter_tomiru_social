import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/bussiness/domain/models/user_model.dart';

class TreeResponse {
  final List<UserModel> f1;
  final List<UserModel> f1NotMember;
  final dynamic incomePXU;
  final dynamic incomeXU;
  final List<TreeNode> trees;

  TreeResponse({
    required this.f1,
    required this.f1NotMember,
    this.incomePXU,
    this.incomeXU,
    required this.trees,
  });

  factory TreeResponse.fromJson(Map<String, dynamic> json) {
    return TreeResponse(
      f1: (json['f1'] as List).map((item) => UserModel.fromJson(item)).toList(),
      f1NotMember: (json['f1NotMember'] as List)
          .map((item) => UserModel.fromJson(item))
          .toList(),
      incomePXU: json['incomePXU'],
      incomeXU: json['incomeXU'],
      trees: (json['trees'] as List)
          .map((item) => TreeNode.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'f1': f1.map((user) => user.toJson()).toList(),
      'f1NotMember': f1NotMember.map((user) => user.toJson()).toList(),
      'incomePXU': incomePXU,
      'incomeXU': incomeXU,
      'trees': trees.map((node) => node.toJson()).toList(),
    };
  }
}
