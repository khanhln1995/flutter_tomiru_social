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

class TreeNode {
  final int floor;
  final String path;
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final dynamic createdAt;
  final String buyPackageAt;
  final dynamic refCode;
  final bool isF1;
  final List<UserBalance> usersBalances;
  final List<TreeNode> children;

  TreeNode({
    required this.floor,
    required this.path,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    this.createdAt,
    required this.buyPackageAt,
    this.refCode,
    required this.isF1,
    required this.usersBalances,
    required this.children,
  });

  factory TreeNode.fromJson(Map<String, dynamic> json) {
    return TreeNode(
      floor: json['floor'],
      path: json['path'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      createdAt: json['createdAt'],
      buyPackageAt: json['buyPackageAt'],
      refCode: json['refCode'],
      isF1: json['isF1'],
      usersBalances: (json['usersBalances'] as List)
          .map((item) => UserBalance.fromJson(item))
          .toList(),
      children: (json['children'] as List)
          .map((item) => TreeNode.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'floor': floor,
      'path': path,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'createdAt': createdAt,
      'buyPackageAt': buyPackageAt,
      'refCode': refCode,
      'isF1': isF1,
      'usersBalances': usersBalances.map((balance) => balance.toJson()).toList(),
      'children': children.map((node) => node.toJson()).toList(),
    };
  }
}