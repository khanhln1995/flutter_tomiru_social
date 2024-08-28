class UserModel {
  final String username;
  final String email;
  final bool isMember;
  final int buyPackageAt;
  final int createdAt;

  UserModel({
    required this.username,
    required this.email,
    required this.isMember,
    required this.buyPackageAt,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      isMember: json['isMember'],
      buyPackageAt: json['buyPackageAt'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'isMember': isMember,
      'buyPackageAt': buyPackageAt,
      'createdAt': createdAt,
    };
  }
}
