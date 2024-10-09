class FriendUser {
  final int id;
  final String? fullName;
  final String? username;
  final String? avatar;
  final String? status;
  final int? createdAt;
  final int? updateAt;
  final int? userId;
  final bool? privateProfile;
  final bool? statusFollow;

  FriendUser({
    required this.id,
    this.fullName,
    this.username,
    this.avatar,
    this.status,
    this.createdAt,
    this.updateAt,
    this.userId,
    this.privateProfile,
    this.statusFollow,
  });

  factory FriendUser.fromJson(Map<String, dynamic> json) {
    return FriendUser(
      id: json['id'] as int,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as int?,
      updateAt: json['updateAt'] as int?,
      userId: json['userId'] as int?,
      privateProfile: json['privateProfile'] as bool?,
      statusFollow: json['statusFollow'] as bool?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'avatar': avatar,
      'status': status,
      'createdAt': createdAt,
      'updateAt': updateAt,
      'userId': userId,
      'privateProfile': privateProfile,
      'statusFollow': statusFollow,
    };
  }
}
