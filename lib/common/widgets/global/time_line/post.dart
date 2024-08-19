class Post {
  final String userName;
  final String avatar;
  final String content;
  final List<String> images;
  final List<String> comment;
  final String like;
  final String share;
  final String createAt;

  Post(
      {required this.userName,
      required this.avatar,
      required this.content,
      required this.images,
      required this.comment,
      required this.like,
      required this.share,
      required this.createAt});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userName: json['userName'],
        avatar: json['avatar'],
        content: json['content'],
        images: List<String>.from(json['images']),
        comment: List<String>.from(json['comment']),
        like: json['like'],
        share: json['share'],
        createAt: json['createAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'avatar': avatar,
      'content': content,
      'images': images,
      'comment': comment,
      'like': like,
      'share': share,
      'createAt': createAt,
    };
  }

  @override
  String toString() {
    return 'Post(userName: $userName, avatar: $avatar, content: $content, images: $images, comment: $comment, like: $like, share: $share, createAt: $createAt)';
  }
}
