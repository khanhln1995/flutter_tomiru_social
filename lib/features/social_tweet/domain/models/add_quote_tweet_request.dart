import 'package:tomiru_social_flutter/common/social/common.dart';

class AddQuoteTweetRequest {
  final String text;
  final List<Image>? images;
  final String? imageDescription;
  final List<int>? taggedImageUsers;
  final String replyType;
  final int tweetId;
  final String? userId;

  AddQuoteTweetRequest({
    required this.text,
    this.images,
    this.imageDescription,
    this.taggedImageUsers,
    required this.replyType,
    required this.tweetId,
    this.userId,
  });

  factory AddQuoteTweetRequest.fromJson(Map<String, dynamic> json) {
    return AddQuoteTweetRequest(
      text: json['text'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((item) => Image.fromJson(item))
          .toList(),
      imageDescription: json['imageDescription'] as String?,
      taggedImageUsers: (json['taggedImageUsers'] as List<dynamic>?)
          ?.map((item) => item as int)
          .toList(),
      replyType: json['replyType'] as String,
      tweetId: json['tweetId'] as int,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'images': images?.map((img) => img.toJson()).toList(),
      'imageDescription': imageDescription,
      'taggedImageUsers': taggedImageUsers,
      'replyType': replyType,
      'tweetId': tweetId,
      'userId': userId,
    };
  }
}
