class Packages {
  final double vat;
  final List<PackagesAvailable> packages;
  Packages({required this.vat, required this.packages});

  factory Packages.fromJson(Map<String, dynamic> json) {
    return Packages(
      vat: json['vat'],
      packages: (json['packages'] as List)
          .map((item) => PackagesAvailable.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vat': vat,
      'packages': packages.map((data) => data.toJson()).toList(),
    };
  }
}

class PackagesAvailable {
  final int id;
  final String name;
  final String description;
  final int price;
  final int discount;
  final int validInDay;
  final String nextPackageAllow;
  final int status;
  final int createdAt;
  final String updatedAt;
  PackagesAvailable({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.validInDay,
    required this.nextPackageAllow,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PackagesAvailable.fromJson(Map<String, dynamic> json) {
    return PackagesAvailable(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      validInDay: json['validInDay'],
      nextPackageAllow: json['nextPackageAllow'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
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
      'nextPackageAllow': nextPackageAllow,
      'status': status,
      'createAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
