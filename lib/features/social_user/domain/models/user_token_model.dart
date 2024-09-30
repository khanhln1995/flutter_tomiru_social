class UserTokenResponse {
  final int? id;
  final String? email;
  final String? fullName;
  final String? username;
  final String? location;
  final String? about;
  final String? website;
  final String? countryCode;
  final String? phone;
  final String? country;
  final String? gender;
  final String? language;
  final String? birthday;
  final String? registrationDate;
  final int? tweetCount;
  final int? mediaTweetCount;
  final int? likeCount;
  final int? notificationsCount;
  final int? mentionsCount;
  final bool? active;
  final bool? profileCustomized;
  final bool? profileStarted;
  final bool? isMutedDirectMessages;
  final bool? isPrivateProfile;
  final String? backgroundColor;
  final String? colorScheme;
  final String? avatar;
  final String? wallpaper;
  final int? pinnedTweetId;
  final int? followersCount;
  final int? followingCount;
  final int? followerRequestsCount;
  final int? unreadMessagesCount;

  UserTokenResponse({
    this.id,
    this.email,
    this.fullName,
    this.username,
    this.location,
    this.about,
    this.website,
    this.countryCode,
    this.phone,
    this.country,
    this.gender,
    this.language,
    this.birthday,
    this.registrationDate,
    this.tweetCount,
    this.mediaTweetCount,
    this.likeCount,
    this.notificationsCount,
    this.mentionsCount,
    this.active,
    this.profileCustomized,
    this.profileStarted,
    this.isMutedDirectMessages,
    this.isPrivateProfile,
    this.backgroundColor,
    this.colorScheme,
    this.avatar,
    this.wallpaper,
    this.pinnedTweetId,
    this.followersCount,
    this.followingCount,
    this.followerRequestsCount,
    this.unreadMessagesCount,
  });

  factory UserTokenResponse.fromJson(Map<String, dynamic> json) {
    return UserTokenResponse(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      username: json['username'],
      location: json['location'],
      about: json['about'],
      website: json['website'],
      countryCode: json['countryCode'],
      phone: json['phone'] != null ? json['phone'].toString() : null,
      country: json['country'],
      gender: json['gender'],
      language: json['language'],
      birthday: json['birthday'],
      registrationDate: json['registrationDate'],
      tweetCount: json['tweetCount'],
      mediaTweetCount: json['mediaTweetCount'],
      likeCount: json['likeCount'],
      notificationsCount: json['notificationsCount'],
      mentionsCount: json['mentionsCount'],
      active: json['active'],
      profileCustomized: json['profileCustomized'],
      profileStarted: json['profileStarted'],
      isMutedDirectMessages: json['isMutedDirectMessages'],
      isPrivateProfile: json['isPrivateProfile'],
      backgroundColor: json['backgroundColor'],
      colorScheme: json['colorScheme'],
      avatar: json['avatar'],
      wallpaper: json['wallpaper'],
      pinnedTweetId: json['pinnedTweetId'],
      followersCount: json['followersCount'],
      followingCount: json['followingCount'],
      followerRequestsCount: json['followerRequestsCount'],
      unreadMessagesCount: json['unreadMessagesCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'username': username,
      'location': location,
      'about': about,
      'website': website,
      'countryCode': countryCode,
      'phone': phone, // Không cần chuyển đổi khi lưu ngược lại
      'country': country,
      'gender': gender,
      'language': language,
      'birthday': birthday,
      'registrationDate': registrationDate,
      'tweetCount': tweetCount,
      'mediaTweetCount': mediaTweetCount,
      'likeCount': likeCount,
      'notificationsCount': notificationsCount,
      'mentionsCount': mentionsCount,
      'active': active,
      'profileCustomized': profileCustomized,
      'profileStarted': profileStarted,
      'isMutedDirectMessages': isMutedDirectMessages,
      'isPrivateProfile': isPrivateProfile,
      'backgroundColor': backgroundColor,
      'colorScheme': colorScheme,
      'avatar': avatar,
      'wallpaper': wallpaper,
      'pinnedTweetId': pinnedTweetId,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'followerRequestsCount': followerRequestsCount,
      'unreadMessagesCount': unreadMessagesCount,
    };
  }
}
