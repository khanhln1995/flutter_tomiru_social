class SocialEndpoint {
  static const String UI_V1_TWEETS = '/ui/v1/tweets?page={page}';
  static const String UI_V1_TWEETS_ID = '/ui/v1/tweets/';

  static const String UI_V1_TWEETS_USER_ID =
      '/ui/v1/tweets/user/{userId}?page={page}';
  static const String UI_V1_PINNED_TWEET_USER_ID = '/ui/v1/tweets/pinned/user/';

  static const String UI_V1_TWEETS_MEDIA_USER_ID =
      '/ui/v1/tweets/media/user/{userId}';

  static const String UI_V1_TWEETS_IMAGES_USER_ID =
      '/ui/v1/tweets/images/{userId}';
  static const String UI_V1_TWEETS_ID_INFO = '/ui/v1/tweets/{tweetId}/info';
  static const String UI_V1_TWEETS_ID_REPLIES =
      '/ui/v1/tweets/{tweetId}/replies';
  static const String UI_V1_TWEETS_ID_QUOTES =
      '/ui/v1/tweets/{tweetId}/quotes?page={page}';
  static const String UI_V1_TWEETS_FOLLOWER =
      '/ui/v1/tweets/follower?page={page}';

  static const String UI_V1_TWEETS_CREATE = '/ui/v1/tweets';
  static const String UI_V1_TWEETS_EDIT = '/ui/v1/tweets/update_tweet';
  static const String UI_V1_TWEETS_SEARCH_TEXT =
      '/ui/v1/tweets/search/{text}?page={page}';
  static const String UI_V1_TWEETS_REPLY =
      '/ui/v1/tweets/reply/{userId}/{tweetId}';
  static const String UI_V1_TWEETS_QUOTE =
      '/ui/v1/tweets/quote/{userId}/{tweetId}';
  static const String UI_V1_TWEETS_CHANGE_REPLY =
      '/ui/v1/tweets/reply/change/{userId}/{tweetId}?replyType={replyType}';
}
