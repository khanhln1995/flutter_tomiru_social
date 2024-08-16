// import 'package:tomiru_social_flutter/features/chat/domain/models/conversation_model.dart';

class SelfInfoModel {
  int? id;
  String? fullname;
  String? username;
  String? email;
  String? location;
  String? phone;
  String? birthday;
  String? about;
  String? website;
  String? countryCode;
  String? country;
  String? gender;
  String? language;
  String? registrationDate;
  int? mediaTweetCount;
  int? tweetCount;
  int? likeCount;
  int? notificationsCount;
  int? mentionsCount;
  bool? active;
  bool? profileCustomized;
  bool? profileStarted;
  String? backgroundColor;
  String? colorScheme;
  String? avatar;
  String? wallpaper;
  int? pinnedTweetId;
  int? followersCount;
  int? followingCount;
  int? followerRequestsCount;
  int? unreadMessagesCount;
  bool? isMutedDirectMessages;
  bool? isPrivateProfile;
  // User? userInfo;

  SelfInfoModel({
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.location,
    this.phone,
    this.birthday,
    this.about,
    this.website,
    this.countryCode,
    this.country,
    this.gender,
    this.language,
    this.registrationDate,
    this.mediaTweetCount,
    this.tweetCount,
    this.likeCount,
    this.notificationsCount,
    this.mentionsCount,
    this.active,
    this.profileCustomized,
    this.profileStarted,
    this.backgroundColor,
    this.colorScheme,
    this.avatar,
    this.wallpaper,
    this.pinnedTweetId,
    this.followersCount,
    this.followingCount,
    this.followerRequestsCount,
    this.unreadMessagesCount,
    this.isMutedDirectMessages,
    this.isPrivateProfile,
    // this.userInfo,
  });

  SelfInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullName'];
    username = json['username'];
    email = json['email'];
    location = json['location'];
    phone = json['phone']?.toString();
    birthday = json['birthday'];
    about = json['about'];
    website = json['website'];
    countryCode = json['countryCode'];
    country = json['country'];
    gender = json['gender'];
    language = json['language'];
    registrationDate = json['registrationDate'];
    mediaTweetCount = json['mediaTweetCount'];
    tweetCount = json['tweetCount'];
    likeCount = json['likeCount'];
    notificationsCount = json['notificationsCount'];
    mentionsCount = json['mentionsCount'];
    active = json['active'];
    profileCustomized = json['profileCustomized'];
    profileStarted = json['profileStarted'];
    backgroundColor = json['backgroundColor'];
    colorScheme = json['colorScheme'];
    avatar = json['avatar'];
    wallpaper = json['wallpaper'];
    pinnedTweetId = json['pinnedTweetId'];
    followersCount = json['followersCount'];
    followingCount = json['followingCount'];
    followerRequestsCount = json['followerRequestsCount'];
    unreadMessagesCount = json['unreadMessagesCount'];
    isMutedDirectMessages = json['isMutedDirectMessages'];
    isPrivateProfile = json['isPrivateProfile'];
    // userInfo =
    //     json['userinfo'] != null ? User.fromJson(json['userinfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['location'] = location;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['about'] = about;
    data['website'] = website;
    data['countryCode'] = countryCode;
    data['country'] = country;
    data['gender'] = gender;
    data['language'] = language;
    data['registrationDate'] = registrationDate;
    data['mediaTweetCount'] = mediaTweetCount;
    data['tweetCount'] = tweetCount;
    data['likeCount'] = likeCount;
    data['notificationsCount'] = notificationsCount;
    data['mentionsCount'] = mentionsCount;
    data['active'] = active;
    data['profileCustomized'] = profileCustomized;
    data['profileStarted'] = profileStarted;
    data['backgroundColor'] = backgroundColor;
    data['colorScheme'] = colorScheme;
    data['avatar'] = avatar;
    data['wallpaper'] = wallpaper;
    data['pinnedTweetId'] = pinnedTweetId;
    data['followersCount'] = followersCount;
    data['followingCount'] = followingCount;
    data['followerRequestsCount'] = followerRequestsCount;
    data['unreadMessagesCount'] = unreadMessagesCount;
    data['isMutedDirectMessages'] = isMutedDirectMessages;
    data['isPrivateProfile'] = isPrivateProfile;
    // if (userInfo != null) {
    //   data['user`info'] = userInfo!.toJson();
    // }
    return data;
  }
}
