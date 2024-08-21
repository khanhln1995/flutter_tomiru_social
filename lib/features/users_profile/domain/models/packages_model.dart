class Package {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final double? discount;
  final int? validInDay;
  final double? total;
  final String? nextPackageAllow;
  final int? status;
  final int? createdAt;
  final int? updatedAt;

  Package({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.validInDay,
    this.total,
    this.nextPackageAllow,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      validInDay: json['validInDay'],
      total: json['total'] != null ? json['total'].toDouble() : null,
      nextPackageAllow: json['nextPackageAllow'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'] != null ? int.tryParse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'validInDay': validInDay,
      'total': total,
      'nextPackageAllow': nextPackageAllow,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class PackagesModel {
  final List<Package> packages;

  PackagesModel({required this.packages});

  factory PackagesModel.fromJson(List<dynamic> json) {
    List<Package> packagesList = json.map((i) => Package.fromJson(i)).toList();
    return PackagesModel(packages: packagesList);
  }

  List<Map<String, dynamic>> toJson() {
    return packages.map((package) => package.toJson()).toList();
  }
}