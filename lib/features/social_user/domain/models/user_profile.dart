import 'package:tomiru_social_flutter/common/social/common.dart';

class UserProfileResponse {
  final int? id;
  final String? fullName;
  final String? username;
  final String? location;
  final String? about;
  final String? website;
  final String? country;
  final String? birthday;
  final String? registrationDate;
  final int? tweetCount;
  final int? mediaTweetCount;
  final int? likeCount;
  final bool? isMutedDirectMessages;
  final bool? isPrivateProfile;
  final String? avatar;
  final String? wallpaper;
  final int? pinnedTweetId;
  final int? followersCount;
  final int? followingCount;
  final bool? isUserMuted;
  final bool? isUserBlocked;
  final bool? isMyProfileBlocked;
  final bool? isWaitingForApprove;
  final bool? isFollower;
  final bool? isSubscriber;
  final List<SameFollowerResponse>? sameFollowers;

  UserProfileResponse({
    this.id,
    this.fullName,
    this.username,
    this.location,
    this.about,
    this.website,
    this.country,
    this.birthday,
    this.registrationDate,
    this.tweetCount,
    this.mediaTweetCount,
    this.likeCount,
    this.isMutedDirectMessages,
    this.isPrivateProfile,
    this.avatar,
    this.wallpaper,
    this.pinnedTweetId,
    this.followersCount,
    this.followingCount,
    this.isUserMuted,
    this.isUserBlocked,
    this.isMyProfileBlocked,
    this.isWaitingForApprove,
    this.isFollower,
    this.isSubscriber,
    this.sameFollowers,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
      location: json['location'],
      about: json['about'],
      website: json['website'],
      country: json['country'],
      birthday: json['birthday'],
      registrationDate: json['registrationDate'],
      tweetCount: json['tweetCount'],
      mediaTweetCount: json['mediaTweetCount'],
      likeCount: json['likeCount'],
      isMutedDirectMessages: json['isMutedDirectMessages'],
      isPrivateProfile: json['isPrivateProfile'],
      avatar: json['avatar'],
      wallpaper: json['wallpaper'],
      pinnedTweetId: json['pinnedTweetId'],
      followersCount: json['followersCount'],
      followingCount: json['followingCount'],
      isUserMuted: json['isUserMuted'],
      isUserBlocked: json['isUserBlocked'],
      isMyProfileBlocked: json['isMyProfileBlocked'],
      isWaitingForApprove: json['isWaitingForApprove'],
      isFollower: json['isFollower'],
      isSubscriber: json['isSubscriber'],
      sameFollowers: (json['sameFollowers'] as List<dynamic>?)
          ?.map((e) => SameFollowerResponse.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'location': location,
      'about': about,
      'website': website,
      'country': country,
      'birthday': birthday,
      'registrationDate': registrationDate,
      'tweetCount': tweetCount,
      'mediaTweetCount': mediaTweetCount,
      'likeCount': likeCount,
      'isMutedDirectMessages': isMutedDirectMessages,
      'isPrivateProfile': isPrivateProfile,
      'avatar': avatar,
      'wallpaper': wallpaper,
      'pinnedTweetId': pinnedTweetId,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'isUserMuted': isUserMuted,
      'isUserBlocked': isUserBlocked,
      'isMyProfileBlocked': isMyProfileBlocked,
      'isWaitingForApprove': isWaitingForApprove,
      'isFollower': isFollower,
      'isSubscriber': isSubscriber,
      'sameFollowers': sameFollowers?.map((e) => e.toJson()).toList(),
    };
  }
}

class EditAboutRequest {
  final String? about;

  EditAboutRequest({this.about});

  factory EditAboutRequest.fromJson(Map<String, dynamic> json) {
    return EditAboutRequest(
      about: json['about'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'about': about,
    };
  }
}
