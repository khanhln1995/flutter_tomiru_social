class SocialEndpoint {
  static const String UI_V1_TWEETS = '/ui/v1/tweets?page={page}';
  static const String UI_V1_TWEETS_ID = '/ui/v1/tweets/';

  static const String UI_V1_TWEETS_USER_ID =
      '/ui/v1/tweets/user/{userId}?page={page}';
  static const String UI_V1_PINNED_TWEET_USER_ID = '/ui/v1/tweets/pinned/user/';
  static const String UI_V1_TWEETS_IMAGE_TAGGED =
      '/ui/v1/tweets/image/tagged/{tweetId}?page={page}';

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
  static const String UI_V1_TWEETS_UPLOAD = '/ui/v1/tweets/upload';
  //phuong thuc post
  static const String UI_V1_TWEETS_UPLOAD_VIDEO = '/ui/v1/tweets/video';
  //~~~~~search~~~~~~~
  static const String UI_V1_SEARCH_USER =
      '/ui/v1/search/findusers?userName={name}&size={size}';
  static const String UI_V1_SEARCH_TAG = '/ui/v1/search/findtags?tagName={tag}';
  static const String UI_V1_SEARCH_TEXT =
      '/ui/v1/search/findtweets?text={text}&size={size}';
  //~~~~~~user~~~~~~~~
  static const String UI_V1_USER_TOKEN = '/ui/v1/user/token';
  static const String UI_V1_USER_USER_ID = '/ui/v1/user/{userId}';
  static const String UI_V1_USER_ALL = '/ui/v1/user/all';
  //gợi ý người dùng
  static const String UI_V1_USER_RELEVANT = '/ui/v1/user/relevant';
  static const String UI_V1_USER_SEARCH_RESULTS = '/ui/v1/user/search/results';
  static const String UI_V1_USER_PROFILE = '/ui/v1/user/profile';
  static const String UI_V1_USER_ABOUT = '/ui/v1/user/about';
  static const String UI_V1_USER_PIN_TWEET_ID =
      '/ui/v1/user/pin/tweet/{tweetId}';
  static const String UI_V1_USER_DETAILS_USER_ID =
      '/ui/v1/user/details/{tweetId}';
  static const String UI_V1_LIST_FRIEND =
      '/ui/v1/user/getList_friend?userId={userId}';
  static const String UI_V1_USER_BLOCKED = '/ui/v1/user/blocked?page={page}';
  static const String UI_V1_USER_BLOCKED_USER_ID =
      '/ui/v1/user/blocked/{userId}';
  static const String UI_V1_USER_FOLLOWERS_USER_ID =
      '/ui/v1/user/followers/{userId}?page={page}';
  static const String UI_V1_USER_FOLLOWING_USER_ID =
      '/ui/v1/user/following/{userId}?page={page}';
  static const String UI_V1_USER_FOLLOW_USER_ID = '/ui/v1/user/follow/{userId}';
  static const String UI_V1_USER_MUTED = '/ui/v1/user/muted?page={page}';
  static const String UI_V1_USER_MUTED_USER_ID = '/ui/v1/user/muted/{userId}';
  static const String UI_V1_USER_SUBSCRIBE_USER_ID =
      '/ui/v1/user/subscribe/{userId}';
  static const String UI_V1_USER_SETTINGS_UPDATE_USERNAME =
      '/ui/v1/user/settings/update/username';
  static const String UI_V1_USER_SETTINGS_UPDATE_EMAIL =
      '/ui/v1/user/settings/update/email';
  static const String UI_V1_USER_SETTINGS_UPDATE_PHONE =
      '/ui/v1/user/settings/update/phone';
  static const String UI_V1_USER_SETTINGS_UPDATE_COUNTRY =
      '/ui/v1/user/settings/update/country';
  static const String UI_V1_USER_SETTINGS_UPDATE_GENDER =
      '/ui/v1/user/settings/update/gender';
  static const String UI_V1_USER_SETTINGS_UPDATE_LANGUAGE =
      '/ui/v1/user/settings/update/language';
  static const String UI_V1_USER_SETTINGS_UPDATE_DIRECT =
      '/ui/v1/user/settings/update/direct';
  static const String UI_V1_USER_SETTINGS_UPDATE_PRIVATE =
      '/ui/v1/user/settings/update/private';
  static const String UI_V1_USER_SETTINGS_UPDATE_COLOR_SCHEME =
      '/ui/v1/user/settings/update/color_scheme';
  static const String UI_V1_USER_SETTINGS_UPDATE_BACKGROUND_COLOR =
      '/ui/v1/user/settings/update/background_color';
}
