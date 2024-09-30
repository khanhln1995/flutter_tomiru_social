import 'package:flutter/foundation.dart';

class Token {
  final String logo;
  final String symbol;
  final String name;

  Token({
    required this.logo,
    required this.symbol,
    required this.name,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      logo: json['logo'],
      symbol: json['symbol'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'logo': logo,
      'symbol': symbol,
      'name': name,
    };
  }
}

class UserBalance {
  final String balance;
  final Token token;

  UserBalance({
    required this.balance,
    required this.token,
  });

  factory UserBalance.fromJson(Map<String, dynamic> json) {
    return UserBalance(
      balance: json['balance'],
      token: Token.fromJson(json['token']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'token': token.toJson(),
    };
  }
}

class Package {
  final String? name;
  final int? price;
  final int? validInDay;
  final String? description;
  final int? discount;
  final int? createdAt;
  final int? updatedAt;

  Package({
    this.name,
    this.price,
    this.validInDay,
    this.description,
    this.discount,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      name: json['name'],
      price: json['price'],
      validInDay: json['validInDay'],
      description: json['description'],
      discount: json['discount'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'validInDay': validInDay,
      'description': description,
      'discount': discount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
class UserProfile {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String? gender;
  final String status;
  final String kycStatus;
  final String phone;
  final String refCode;
  final bool twoFaEnabled;
  final bool checkedIn;
  final int checkInBonus;
  final String? createdAt;
  final String phoneCode;
  final String? slug;
  final String profileImage;
  final String coverImage;
  final String profileImageFull;
  final String coverImageFull;
  final int buyPackageAt;
  final int expiredPremiumAt;
  final List<UserBalance> usersBalances;
  final Package package;
  final String? introduce;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    this.gender,
    required this.status,
    required this.kycStatus,
    required this.phone,
    required this.refCode,
    required this.twoFaEnabled,
    required this.checkedIn,
    required this.checkInBonus,
    this.createdAt,
    required this.phoneCode,
    this.slug,
    required this.profileImage,
    required this.coverImage,
    required this.profileImageFull,
    required this.coverImageFull,
    required this.buyPackageAt,
    required this.expiredPremiumAt,
    required this.usersBalances,
    required this.package,
    this.introduce,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      gender: json['gender'] ?? '',
      status: json['status'] ?? '',
      kycStatus: json['kycStatus'] ?? '',
      phone: json['phone'] ?? '',
      refCode: json['refCode'] ?? '',
      twoFaEnabled: json['twoFaEnabled'] ?? '',
      checkedIn: json['checkedIn'] ?? '',
      checkInBonus: json['checkInBonus'] ?? '',
      createdAt: json['createdAt'] ?? '',
      phoneCode: json['phoneCode'] ?? '',
      slug: json['slug'] ?? '',
      profileImage: json['profileImage'] ?? '',
      coverImage: json['coverImage'] ?? '',
      profileImageFull: json['profileImageFull'] ?? '',
      coverImageFull: json['coverImageFull'] ?? '',
      buyPackageAt: json['buyPackageAt'] ?? '',
      expiredPremiumAt: json['expiredPremiumAt'] ?? '',
      usersBalances: (json['usersBalances'] as List)
          .map((balance) => UserBalance.fromJson(balance))
          .toList(),
      package: Package.fromJson(json['package']),
      introduce: json['introduce'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'gender': gender,
      'status': status,
      'kycStatus': kycStatus,
      'phone': phone,
      'refCode': refCode,
      'twoFaEnabled': twoFaEnabled,
      'checkedIn': checkedIn,
      'checkInBonus': checkInBonus,
      'createdAt': createdAt,
      'phoneCode': phoneCode,
      'slug': slug,
      'profileImage': profileImage,
      'coverImage': coverImage,
      'profileImageFull': profileImageFull,
      'coverImageFull': coverImageFull,
      'buyPackageAt': buyPackageAt,
      'expiredPremiumAt': expiredPremiumAt,
      'usersBalances':
          usersBalances.map((balance) => balance.toJson()).toList(),
      'package': package.toJson(),
      'introduce': introduce,
    };
  }

  @override
  String toString() {
    return 'UserProfile('
      'firstName: $firstName, '
      'lastName: $lastName, '
      'email: $email, '
      'username: $username, '
      'gender: $gender, '
      'status: $status, '
      'kycStatus: $kycStatus, '
      'phone: $phone, '
      'refCode: $refCode, '
      'twoFaEnabled: $twoFaEnabled, '
      'checkedIn: $checkedIn, '
      'checkInBonus: $checkInBonus, '
      'createdAt: $createdAt, '
      'phoneCode: $phoneCode, '
      'slug: $slug, '
      'profileImage: $profileImage, '
      'coverImage: $coverImage, '
      'profileImageFull: $profileImageFull, '
      'coverImageFull: $coverImageFull, '
      'buyPackageAt: $buyPackageAt, '
      'expiredPremiumAt: $expiredPremiumAt, '
      'usersBalances: ${usersBalances.map((balance) => balance.toJson()).toList()}, '
      'package: ${package.toJson()}, '
      'introduce: $introduce'
      ')';
  }
}


