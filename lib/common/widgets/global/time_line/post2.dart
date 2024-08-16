class Post2 {
  final int id;
  final String text;
  final String tweetType;
  final DateTime createdAt;
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
  final List<ImageItem> images; // Kiểu dữ liệu đã thay đổi
  final String imageDescription;
  final List<String> taggedImageUsers;
  final int retweetsCount; // Thay đổi từ String thành int
  final int likesCount; // Thay đổi từ String thành int
  final int repliesCount; // Thay đổi từ String thành int
  final int quotesCount;
  final bool isDeleted;
  final bool isTweetLiked;
  final bool isTweetRetweeted;
  final bool isUserFollowByOtherUser;
  final bool isTweetDeleted;
  final bool isTweetBookmarked;

  Post2({
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
    required this.images, // Kiểu dữ liệu đã thay đổi
    required this.imageDescription,
    required this.taggedImageUsers,
    required this.retweetsCount, // Thay đổi từ String thành int
    required this.likesCount, // Thay đổi từ String thành int
    required this.repliesCount, // Thay đổi từ String thành int
    required this.quotesCount,
    required this.isDeleted,
    required this.isTweetLiked,
    required this.isTweetRetweeted,
    required this.isUserFollowByOtherUser,
    required this.isTweetDeleted,
    required this.isTweetBookmarked,
  });

  factory Post2.fromJson(Map<String, dynamic> json) {
    return Post2(
      id: json['id'],
      text: json['text'],
      tweetType: json['tweetType'],
      createdAt: DateTime.parse(json['createdAt']),
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
      taggedImageUsers: List<String>.from(json['taggedImageUsers']),
      retweetsCount: json['retweetsCount'], // Thay đổi từ String thành int
      likesCount: json['likesCount'], // Thay đổi từ String thành int
      repliesCount: json['repliesCount'], // Thay đổi từ String thành int
      quotesCount: json['quotesCount'],
      isDeleted: json['isDeleted'],
      isTweetLiked: json['isTweetLiked'],
      isTweetRetweeted: json['isTweetRetweeted'],
      isUserFollowByOtherUser: json['isUserFollowByOtherUser'],
      isTweetDeleted: json['isTweetDeleted'],
      isTweetBookmarked: json['isTweetBookmarked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'tweetType': tweetType,
      'createdAt': createdAt.toIso8601String(),
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
      'images': images.map((image) => image.toJson()).toList(),
      'imageDescription': imageDescription,
      'taggedImageUsers': taggedImageUsers,
      'retweetsCount': retweetsCount, // Thay đổi từ String thành int
      'likesCount': likesCount, // Thay đổi từ String thành int
      'repliesCount': repliesCount, // Thay đổi từ String thành int
      'quotesCount': quotesCount,
      'isDeleted': isDeleted,
      'isTweetLiked': isTweetLiked,
      'isTweetRetweeted': isTweetRetweeted,
      'isUserFollowByOtherUser': isUserFollowByOtherUser,
      'isTweetDeleted': isTweetDeleted,
      'isTweetBookmarked': isTweetBookmarked,
    };
  }

  @override
  String toString() {
    return 'Post2(id: $id, text: $text, tweetType: $tweetType, createdAt: $createdAt, author: $author, images: $images)';
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
