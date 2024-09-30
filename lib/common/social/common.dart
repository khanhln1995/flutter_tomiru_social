// PageableResponse
class PageableResponse<T> {
  final T items;
  final int pagesCount;

  PageableResponse({required this.items, required this.pagesCount});

  factory PageableResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return PageableResponse(
      items: fromJsonT(json['items']),
      pagesCount: json['pagesCount'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'items': toJsonT(items),
      'pagesCount': pagesCount,
    };
  }
}

// LoadingStatus enum
enum LoadingStatus { LOADED, LOADING, ERROR, NEVER, SUCCESS }

// ColorScheme enum
enum ColorScheme { BLUE, YELLOW, CRIMSON, VIOLET, ORANGE, GREEN }

// BackgroundTheme enum
enum BackgroundTheme { DEFAULT, DIM, LIGHTS_OUT }

// Image model
class Image {
  final int id;
  final String src;

  Image({required this.id, required this.src});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
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
}

// ReplyType enum
enum ReplyType { EVERYONE, FOLLOW, MENTION }

ReplyType replyTypeFromJson(String json) {
  switch (json) {
    case 'EVERYONE':
      return ReplyType.EVERYONE;
    case 'FOLLOW':
      return ReplyType.FOLLOW;
    case 'MENTION':
      return ReplyType.MENTION;
    default:
      throw Exception('Unknown ReplyType: $json');
  }
}

String replyTypeToJson(ReplyType replyType) {
  return replyType.toString().split('.').last;
}

// LinkCoverSize enum
enum LinkCoverSize { SMALL, MEDIUM, LARGE }

LinkCoverSize linkCoverSizeFromJson(String json) {
  switch (json) {
    case 'SMALL':
      return LinkCoverSize.SMALL;
    case 'MEDIUM':
      return LinkCoverSize.MEDIUM;
    case 'LARGE':
      return LinkCoverSize.LARGE;
    default:
      throw Exception('Unknown LinkCoverSize: $json');
  }
}

String linkCoverSizeToJson(LinkCoverSize size) {
  return size.toString().split('.').last;
}

// NotificationType enum
enum NotificationType {
  LIKE,
  RETWEET,
  REPLY,
  FOLLOW,
  TWEET,
  LISTS,
  BROWSE_LIST,
  FRIEND
}

class SameFollowerResponse {
  final int id;
  final String? fullName;
  final String? username;
  final String? avatar;

  SameFollowerResponse({
    required this.id,
    this.fullName,
    this.username,
    this.avatar,
  });

  factory SameFollowerResponse.fromJson(Map<String, dynamic> json) {
    return SameFollowerResponse(
      id: json['id'] as int,
      fullName: json['fullName'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'avatar': avatar,
    };
  }
}
