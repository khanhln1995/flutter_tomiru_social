class ChangeReplyTypeRequest {
  final int tweetId;
  final String? userId;
  final String? replyType;

  ChangeReplyTypeRequest({
    required this.tweetId,
    this.userId,
    this.replyType,
  });

  factory ChangeReplyTypeRequest.fromJson(Map<String, dynamic> json) {
    return ChangeReplyTypeRequest(
      tweetId: json['tweetId'] as int,
      userId: json['userId'] as String?,
      replyType: json['replyType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tweetId': tweetId,
      'userId': userId,
      'replyType': replyType,
    };
  }
}
