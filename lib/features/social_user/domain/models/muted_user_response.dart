class MutedUser {
  final int? id;
  final String? fullName;
  final String? username;
  final String? about;
  final String? avatar;
  final bool? isPrivateProfile;
  final bool? isUserMuted;

  MutedUser({
    this.id,
    this.fullName,
    this.username,
    this.about,
    this.avatar,
    this.isPrivateProfile,
    this.isUserMuted,
  });

  factory MutedUser.fromJson(Map<String, dynamic> json) {
    return MutedUser(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      about: json['about'] as String?,
      avatar: json['avatar'] as String?,
      isPrivateProfile: json['isPrivateProfile'] as bool?,
      isUserMuted: json['isUserMuted'] as bool?,
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
      'isUserMuted': isUserMuted,
    };
  }
}
