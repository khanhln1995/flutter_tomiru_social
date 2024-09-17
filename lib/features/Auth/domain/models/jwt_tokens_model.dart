class JwtTokenModel {
  final String token;
  final String shop;
  final String social;

  JwtTokenModel({
    required this.token,
    required this.shop,
    required this.social,
  });

  factory JwtTokenModel.fromJson(Map<String, dynamic> json) {
    return JwtTokenModel(
      token: json['accessToken'].toString(),
      shop: json['accessTokenShop'].toString(),
      social: json['accessTokenSocial'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': token,
      'accessTokenShop': shop,
      'accessTokenSocial': social,
    };
  }
}
