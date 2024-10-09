class Tweet {
  final int id;
  final String text;
  final String tweetType;
  final String createdAt;
  final String? scheduledDate;
  final String? addressedUsername;
  final int? addressedId;
  final int? addressedTweetId;
  final String replyType;
  final String? link;
  final String? linkTitle;
  final String? linkDescription;
  final String? linkCover;
  final String? gifImage;
  final String? linkCoverSize;
  final Author author;
  final List<ImageItem> images;
  final String imageDescription;
  final List<dynamic> taggedImageUsers;
  final QuoteTweet? quoteTweet;
  final int retweetsCount;
  final int likesCount;
  final int repliesCount;
  final int quotesCount;
  final bool isDeleted;
  final bool isTweetLiked;
  final bool isTweetRetweeted;
  final bool isUserFollowByOtherUser;
  final bool isTweetBookmarked;

  Tweet({
    required this.id,
    required this.text,
    required this.tweetType,
    required this.createdAt,
    this.scheduledDate,
    this.addressedUsername,
    this.addressedId,
    this.addressedTweetId,
    required this.replyType,
    this.link,
    this.linkTitle,
    this.linkDescription,
    this.linkCover,
    this.gifImage,
    this.linkCoverSize,
    required this.author,
    required this.images,
    required this.imageDescription,
    required this.taggedImageUsers,
    this.quoteTweet,
    required this.retweetsCount,
    required this.likesCount,
    required this.repliesCount,
    required this.quotesCount,
    required this.isDeleted,
    required this.isTweetLiked,
    required this.isTweetRetweeted,
    required this.isUserFollowByOtherUser,
    required this.isTweetBookmarked,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      id: json['id'],
      text: json['text'],
      tweetType: json['tweetType'],
      createdAt: json['createdAt'],
      scheduledDate: json['scheduledDate'],
      addressedUsername: json['addressedUsername'],
      addressedId: json['addressedId'],
      addressedTweetId: json['addressedTweetId'],
      replyType: json['replyType'],
      link: json['link'],
      linkTitle: json['linkTitle'],
      linkDescription: json['linkDescription'],
      linkCover: json['linkCover'],
      gifImage: json['gifImage'],
      linkCoverSize: json['linkCoverSize'],
      author: Author.fromJson(json['author']),
      images: (json['images'] as List)
          .map((imageJson) => ImageItem.fromJson(imageJson))
          .toList(),
      imageDescription: json['imageDescription'] ?? '',
      taggedImageUsers: List<dynamic>.from(json['taggedImageUsers']),
      quoteTweet: json['quoteTweet'] != null
          ? QuoteTweet.fromJson(json['quoteTweet'])
          : null,
      retweetsCount: json['retweetsCount'] ?? 0,
      likesCount: json['likesCount'] ?? 0,
      repliesCount: json['repliesCount'] ?? 0,
      quotesCount: json['quotesCount'] ?? 0,
      isDeleted: json['isDeleted'] ?? false,
      isTweetLiked: json['isTweetLiked'] ?? false,
      isTweetRetweeted: json['isTweetRetweeted'] ?? false,
      isUserFollowByOtherUser: json['isUserFollowByOtherUser'] ?? false,
      isTweetBookmarked: json['isTweetBookmarked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'tweetType': tweetType,
      'createdAt': createdAt,
      'scheduledDate': scheduledDate,
      'addressedUsername': addressedUsername,
      'addressedId': addressedId,
      'addressedTweetId': addressedTweetId,
      'replyType': replyType,
      'link': link,
      'linkTitle': linkTitle,
      'linkDescription': linkDescription,
      'linkCover': linkCover,
      'gifImage': gifImage,
      'linkCoverSize': linkCoverSize,
      'author': author.toJson(),
      'images': images,
      'imageDescription': imageDescription,
      'taggedImageUsers': taggedImageUsers,
      'quoteTweet': quoteTweet?.toJson(),
      'retweetsCount': retweetsCount,
      'likesCount': likesCount,
      'repliesCount': repliesCount,
      'quotesCount': quotesCount,
      'isDeleted': isDeleted,
      'isTweetLiked': isTweetLiked,
      'isTweetRetweeted': isTweetRetweeted,
      'isUserFollowByOtherUser': isUserFollowByOtherUser,
      'isTweetBookmarked': isTweetBookmarked,
    };
  }
}

class Author {
  final int id;
  final String fullName;
  final String username;
  final String avatar;
  final bool isPrivateProfile;
  final bool isFollower;
  final bool isMyProfileBlocked;
  final bool isUserBlocked;
  final bool isUserMuted;

  Author({
    required this.id,
    required this.fullName,
    required this.username,
    required this.avatar,
    required this.isPrivateProfile,
    required this.isFollower,
    required this.isMyProfileBlocked,
    required this.isUserBlocked,
    required this.isUserMuted,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
      avatar: json['avatar'],
      isPrivateProfile: json['isPrivateProfile'],
      isFollower: json['isFollower'],
      isMyProfileBlocked: json['isMyProfileBlocked'],
      isUserBlocked: json['isUserBlocked'],
      isUserMuted: json['isUserMuted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'avatar': avatar,
      'isPrivateProfile': isPrivateProfile,
      'isFollower': isFollower,
      'isMyProfileBlocked': isMyProfileBlocked,
      'isUserBlocked': isUserBlocked,
      'isUserMuted': isUserMuted,
    };
  }

  @override
  String toString() {
    return 'Author(id: $id, fullName: $fullName, username: $username, avatar: $avatar)';
  }
}

class QuoteTweet {
  final int id;
  final String text;
  final String tweetType;
  final String createdAt;
  final String? link;
  final String? linkTitle;
  final String? linkDescription;
  final String? linkCover;
  final String? linkCoverSize;
  final Author author;
  final bool isDeleted;

  QuoteTweet({
    required this.id,
    required this.text,
    required this.tweetType,
    required this.createdAt,
    this.link,
    this.linkTitle,
    this.linkDescription,
    this.linkCover,
    this.linkCoverSize,
    required this.author,
    required this.isDeleted,
  });

  factory QuoteTweet.fromJson(Map<String, dynamic> json) {
    return QuoteTweet(
      id: json['id'],
      text: json['text'],
      tweetType: json['tweetType'],
      createdAt: json['createdAt'],
      link: json['link'],
      linkTitle: json['linkTitle'],
      linkDescription: json['linkDescription'],
      linkCover: json['linkCover'],
      linkCoverSize: json['linkCoverSize'],
      author: Author.fromJson(json['author']),
      isDeleted: json['isDeleted'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'tweetType': tweetType,
      'createdAt': createdAt,
      'link': link,
      'linkTitle': linkTitle,
      'linkDescription': linkDescription,
      'linkCover': linkCover,
      'linkCoverSize': linkCoverSize,
      'author': author.toJson(),
      'isDeleted': isDeleted,
    };
  }
}

class TweetImageResponse {
  final int tweetId;
  final int imageId;
  final String src;

  TweetImageResponse({
    required this.tweetId,
    required this.imageId,
    required this.src,
  });

  factory TweetImageResponse.fromJson(Map<String, dynamic> json) {
    return TweetImageResponse(
      tweetId: json['tweetId'] != null ? json['tweetId'] as int : 0,
      imageId: json['imageId'] != null ? json['imageId'] as int : 0,
      src: json['src'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tweetId': tweetId,
      'imageId': imageId,
      'src': src,
    };
  }
}

class TweetAdditionalInfoResponse {
  final String? text;
  final String? replyType;
  final int? addressedTweetId;
  final bool isDeleted;
  final Author author;

  TweetAdditionalInfoResponse({
    this.text,
    this.replyType,
    this.addressedTweetId,
    required this.isDeleted,
    required this.author,
  });

  factory TweetAdditionalInfoResponse.fromJson(Map<String, dynamic> json) {
    return TweetAdditionalInfoResponse(
      text: json['text'] as String?,
      replyType: json['replyType'] as String?,
      addressedTweetId: json['addressedTweetId'] as int?,
      isDeleted: json['isDeleted'] as bool,
      author: Author.fromJson(json['author']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'replyType': replyType,
      'addressedTweetId': addressedTweetId,
      'isDeleted': isDeleted,
      'author': author.toJson(),
    };
  }
}

class ImageItem {
  final int id;
  final String src;

  ImageItem({required this.id, required this.src});

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      id: json['id'],
      src: json['src'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'src': src,
    };
  }

  @override
  String toString() {
    return 'ImageItem(id: $id, src: $src)';
  }
}
