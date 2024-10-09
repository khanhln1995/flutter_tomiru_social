class GroupOwner {
  final int? id;
  final String? fullName;
  final String? username;
  final String? about;
  final String? avatar;
  final bool? isPrivateProfile;
  final bool? active;
  final List<dynamic>? userBlockedList;
  final List<dynamic>? followers;
  final List<dynamic>? following;

  GroupOwner({
    this.id,
    this.fullName,
    this.username,
    this.about,
    this.avatar,
    this.isPrivateProfile,
    this.active,
    this.userBlockedList,
    this.followers,
    this.following,
  });

  factory GroupOwner.fromJson(Map<String, dynamic> json) {
    return GroupOwner(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      about: json['about'] as String?,
      avatar: json['avatar'] as String?,
      isPrivateProfile: json['privateProfile'] as bool?,
      active: json['active'] as bool?,
      userBlockedList: json['userBlockedList'] ?? [],
      followers: json['followers'] ?? [],
      following: json['following'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'about': about,
      'avatar': avatar,
      'privateProfile': isPrivateProfile,
      'active': active,
      'userBlockedList': userBlockedList,
      'followers': followers,
      'following': following,
    };
  }
}

class GroupModel {
  final int? id;
  final String? groupName;
  final String? description;
  final String? wallpaper;
  final GroupOwner? groupOwner;
  final String? status;
  final bool? isPrivate;
  final String? createdAt;
  final String? updatedAt;
  final List<int>? groupAdminIds;

  GroupModel({
    this.id,
    this.groupName,
    this.description,
    this.wallpaper,
    this.groupOwner,
    this.status,
    this.isPrivate,
    this.createdAt,
    this.updatedAt,
    this.groupAdminIds,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'] as int?,
      groupName: json['groupName'] as String?,
      description: json['description'] as String?,
      wallpaper: json['wallpaper'] as String?,
      groupOwner: json['groupOwner'] != null
          ? GroupOwner.fromJson(json['groupOwner'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
      isPrivate: json['private'] ?? false,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      groupAdminIds: (json['groupAdminIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'groupName': groupName,
      'description': description,
      'wallpaper': wallpaper,
      'groupOwner': groupOwner?.toJson(),
      'status': status,
      'private': isPrivate,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'groupAdminIds': groupAdminIds,
    };
  }
}

class AcceptUserToGroupRequest {
  final List<int>? userIds;
  final int? groupId;

  AcceptUserToGroupRequest({
    this.userIds,
    this.groupId,
  });
  factory AcceptUserToGroupRequest.fromJson(Map<String, dynamic> json) {
    return AcceptUserToGroupRequest(
      userIds:
          (json['userIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      groupId: json['groupId'] as int?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userIds': userIds,
      'groupId': groupId,
    };
  }
}
