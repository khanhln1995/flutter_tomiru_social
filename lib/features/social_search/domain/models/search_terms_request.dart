class SearchTermsRequest {
  final List<int>? users;
  final List<String>? tags;
  final List<String>? text;

  SearchTermsRequest({
    this.users,
    this.tags,
    this.text,
  });

  factory SearchTermsRequest.fromJson(Map<String, dynamic> json) {
    return SearchTermsRequest(
      users: (json['users'] as List?)?.map((e) => e as int).toList(),
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
      text: (json['text'] as List?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'tags': tags,
      'text': text,
    };
  }
}
