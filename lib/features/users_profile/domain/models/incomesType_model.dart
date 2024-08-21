import 'dart:convert';

class Item {
  final String? key;
  final String? name;

  Item({ this.key,  this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      key: json['key'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
    };
  }
}

class IncomesTypeModel {
  final List<Item> items;
  IncomesTypeModel({required this.items});

  factory IncomesTypeModel.fromJson(List<dynamic> json) {
    List<Item> itemsList = json.map((i) => Item.fromJson(i)).toList();
    return IncomesTypeModel(items: itemsList);
  }
  List<Map<String, dynamic>> toJson() {
    return items.map((item) => item.toJson()).toList();
  }
}