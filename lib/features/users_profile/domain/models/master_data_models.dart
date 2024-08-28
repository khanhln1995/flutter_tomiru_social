import 'package:tomiru_social_flutter/features/bussiness/domain/models/tree_model.dart';
import 'package:tomiru_social_flutter/features/users_profile/domain/models/packages_model.dart';

import 'incomesType_model.dart';

class MasterDataModel {
  final List<Token> tokens;
  final List<Package> packages;
  final List<Item> transactionsType;
  final List<Item> incomesType;

  MasterDataModel({
    required this.packages,
    required this.tokens,
    required this.transactionsType,
    required this.incomesType,
  });

  factory MasterDataModel.fromJson(Map<String, dynamic> json) {
    return MasterDataModel(
      transactionsType: (json['transactionsType'] as List<dynamic>)
          .map((i) => Item.fromJson(i as Map<String, dynamic>))
          .toList(),
      packages: (json['packages'] as List<dynamic>)
          .map((i) => Package.fromJson(i as Map<String, dynamic>))
          .toList(),
      incomesType: (json['incomesType'] as List<dynamic>)
          .map((i) => Item.fromJson(i as Map<String, dynamic>))
          .toList(),
      tokens: (json['tokens'] as List<dynamic>)
          .map((i) => Token.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactionsType':
          transactionsType.map((item) => item.toJson()).toList(),
      'packages': packages.map((package) => package.toJson()).toList(),
      'incomesType': incomesType.map((item) => item.toJson()).toList(),
      'tokens': tokens.map((token) => token.toJson()).toList(),
    };
  }
}
