import 'package:tomiru_social_flutter/common/social/common.dart';

class User {
  final int? id;
  final String? fullName;
  final String? username;
  final String? about;
  final String? avatar;
  final bool? isPrivateProfile;
  final bool? isMutedDirectMessages;
  final bool? isUserBlocked;
  final bool? isMyProfileBlocked;
  final bool? isWaitingForApprove;
  final bool? isUserChatParticipant;
  final bool? isFollower;
  final List<dynamic>? userBlockedList;
  final List<dynamic>? followers;
  final List<dynamic>? following;

  User({
    this.id,
    this.fullName,
    this.username,
    this.about,
    this.avatar,
    this.isPrivateProfile,
    this.isMutedDirectMessages,
    this.isUserBlocked,
    this.isMyProfileBlocked,
    this.isWaitingForApprove,
    this.isUserChatParticipant,
    this.isFollower,
    this.userBlockedList,
    this.followers,
    this.following,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      about: json['about'] as String?,
      avatar: json['avatar'] as String?,
      isPrivateProfile: json['privateProfile'] as bool?,
      isMutedDirectMessages: json['isMutedDirectMessages'] as bool?,
      isUserBlocked: json['isUserBlocked'] as bool?,
      isMyProfileBlocked: json['isMyProfileBlocked'] as bool?,
      isWaitingForApprove: json['isWaitingForApprove'] as bool?,
      isUserChatParticipant: json['isUserChatParticipant'] as bool?,
      isFollower: json['isFollower'] as bool?,
      userBlockedList: json['userBlockedList'],
      followers: json['followers'],
      following: json['following'],
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
      'isMutedDirectMessages': isMutedDirectMessages,
      'isUserBlocked': isUserBlocked,
      'isMyProfileBlocked': isMyProfileBlocked,
      'isWaitingForApprove': isWaitingForApprove,
      'isUserChatParticipant': isUserChatParticipant,
      'isFollower': isFollower,
      'userBlockedList': userBlockedList,
      'followers': followers,
      'following': following,
    };
  }
}

class CommonUser {
  final int? id;
  final String? fullName;
  final String? username;
  final String? avatar;
  final bool? isPrivateProfile;

  CommonUser({
    this.id,
    this.fullName,
    this.username,
    this.avatar,
    this.isPrivateProfile,
  });

  factory CommonUser.fromJson(Map<String, dynamic> json) {
    return CommonUser(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
      avatar: json['avatar'],
      isPrivateProfile: json['isPrivateProfile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'avatar': avatar,
      'isPrivateProfile': isPrivateProfile,
    };
  }
}

class UserDetailResponse {
  final int id;
  final String? fullName;
  final String? username;
  final String? about;
  final String? avatar;
  final bool? isPrivateProfile;
  final bool? isUserBlocked;
  final bool? isMyProfileBlocked;
  final bool? isWaitingForApprove;
  final bool? isFollower;
  final int? followersCount;
  final int? followingCount;
  final List<SameFollowerResponse>? sameFollowers;

  UserDetailResponse({
    required this.id,
    this.fullName,
    this.username,
    this.about,
    this.avatar,
    this.isPrivateProfile,
    this.isUserBlocked,
    this.isMyProfileBlocked,
    this.isWaitingForApprove,
    this.isFollower,
    this.followersCount,
    this.followingCount,
    this.sameFollowers,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) {
    return UserDetailResponse(
      id: json['id'] as int,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      about: json['about'] as String?,
      avatar: json['avatar'] as String?,
      isPrivateProfile: json['isPrivateProfile'] as bool?,
      isUserBlocked: json['isUserBlocked'] as bool?,
      isMyProfileBlocked: json['isMyProfileBlocked'] as bool?,
      isWaitingForApprove: json['isWaitingForApprove'] as bool?,
      isFollower: json['isFollower'] as bool?,
      followersCount: json['followersCount'] as int?,
      followingCount: json['followingCount'] as int?,
      sameFollowers: (json['sameFollowers'] as List<dynamic>?)
          ?.map((follower) =>
              SameFollowerResponse.fromJson(follower as Map<String, dynamic>))
          .toList(),
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
      'isMyProfileBlocked': isMyProfileBlocked,
      'isWaitingForApprove': isWaitingForApprove,
      'isFollower': isFollower,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'sameFollowers':
          sameFollowers?.map((follower) => follower.toJson()).toList(),
    };
  }
}
