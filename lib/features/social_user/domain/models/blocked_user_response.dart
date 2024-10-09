class BlockedUser {
  final int? id;
  final String? fullName;
  final String? username;
  final String? about;
  final String? avatar;
  final bool? isPrivateProfile;
  final bool? isUserBlocked;

  BlockedUser({
    this.id,
    this.fullName,
    this.username,
    this.about,
    this.avatar,
    this.isPrivateProfile,
    this.isUserBlocked,
  });

  factory BlockedUser.fromJson(Map<String, dynamic> json) {
    return BlockedUser(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      about: json['about'] as String?,
      avatar: json['avatar'] as String?,
      isPrivateProfile: json['isPrivateProfile'] as bool?,
      isUserBlocked: json['isUserBlocked'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'about': about,
      'avatar': avatar,
      'isPrivateProfile': isPrivateProfile,
      'isUserBlocked': isUserBlocked,
    };
  }
}

class FollowerUser {
  final int? id;
  final String? fullName;
  final String? username;
  final String? about;
  final String? avatar;

  FollowerUser({
    this.id,
    this.fullName,
    this.username,
    this.about,
    this.avatar,
  });
  factory FollowerUser.fromJson(Map<String, dynamic> json) {
    return FollowerUser(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      about: json['about'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'about': about,
      'avatar': avatar,
    };
  }
}
