import 'package:tomiru_social_flutter/common/social/common.dart';

class ReplyTweetRequest {
  final int tweetId;
  final String? userId;
  final String text;
  final String addressedUsername;
  final int addressedId;
  final String replyType;
  final List<Image>? images;
  final String? imageDescription;
  final List<int>? taggedImageUsers;

  ReplyTweetRequest({
    required this.tweetId,
    this.userId,
    required this.text,
    required this.addressedUsername,
    required this.addressedId,
    required this.replyType,
    this.images,
    this.imageDescription,
    this.taggedImageUsers,
  });

  factory ReplyTweetRequest.fromJson(Map<String, dynamic> json) {
    return ReplyTweetRequest(
      tweetId: json['tweetId'] as int,
      userId: json['userId'] as String?,
      text: json['text'] as String,
      addressedUsername: json['addressedUsername'] as String,
      addressedId: json['addressedId'] as int,
      replyType: json['replyType'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((item) => Image.fromJson(item))
          .toList(),
      imageDescription: json['imageDescription'] as String?,
      taggedImageUsers: (json['taggedImageUsers'] as List<dynamic>?)
          ?.map((item) => item as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tweetId': tweetId,
      'userId': userId,
      'text': text,
      'addressedUsername': addressedUsername,
      'addressedId': addressedId,
      'replyType': replyType,
      'images': images?.map((img) => img.toJson()).toList(),
      'imageDescription': imageDescription,
      'taggedImageUsers': taggedImageUsers,
    };
  }
}
