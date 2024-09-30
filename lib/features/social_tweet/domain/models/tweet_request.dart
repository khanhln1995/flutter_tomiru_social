class TweetRequest {
  final int? id;
  final String text;
  final List<Image> images;
  final String imageDescription;
  final List<int> taggedImageUsers;
  final ReplyType replyType;
  final int? pollDateTime;
  final DateTime? scheduledDate;
  final List<String>? choices;
  final int? listId;
  final GifImageResponse? gifImage;

  TweetRequest({
    this.id,
    required this.text,
    required this.images,
    required this.imageDescription,
    required this.taggedImageUsers,
    required this.replyType,
    this.pollDateTime,
    this.scheduledDate,
    this.choices,
    this.listId,
    this.gifImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'images': images.map((image) => image.toJson()).toList(),
      'imageDescription': imageDescription,
      'taggedImageUsers': taggedImageUsers,
      'replyType': replyType.toString(), // Assuming ReplyType is an enum
      'pollDateTime': pollDateTime,
      'scheduledDate': scheduledDate?.toIso8601String(),
      'choices': choices,
      'listId': listId,
      'gifImage': gifImage?.toJson(),
    };
  }
}

class Image {
  final String? url;
  final String? description;

  Image({
    this.url,
    this.description,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json['url'] != null ? json['url'] as String : null,
      description:
          json['description'] != null ? json['description'] as String : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'description': description,
    };
  }
}

enum ReplyType {
  EVERYONE,
  FOLLOW,
  MENTION,
}

class GifImageResponse {
  final String url;
  final String? title;

  GifImageResponse({
    required this.url,
    this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'title': title,
    };
  }
}
