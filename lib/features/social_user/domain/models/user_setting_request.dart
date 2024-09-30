import 'package:tomiru_social_flutter/common/social/common.dart';

class UserSettingsRequest {
  final String? username;
  final String? email;
  final String? countryCode;
  final int? phone;
  final String? country;
  final String? gender;
  final String? language;
  final bool? mutedDirectMessages;
  final bool? privateProfile;
  final ColorScheme? colorScheme;
  final BackgroundTheme? backgroundColor;

  UserSettingsRequest({
    this.username,
    this.email,
    this.countryCode,
    this.phone,
    this.country,
    this.gender,
    this.language,
    this.mutedDirectMessages,
    this.privateProfile,
    this.colorScheme,
    this.backgroundColor,
  });

  factory UserSettingsRequest.fromJson(Map<String, dynamic> json) {
    return UserSettingsRequest(
      username: json['username'] as String?,
      email: json['email'] as String?,
      countryCode: json['countryCode'] as String?,
      phone: json['phone'] as int?,
      country: json['country'] as String?,
      gender: json['gender'] as String?,
      language: json['language'] as String?,
      mutedDirectMessages: json['mutedDirectMessages'] as bool?,
      privateProfile: json['privateProfile'] as bool?,
      colorScheme: json['colorScheme'] != null
          ? colorSchemeFromJson(json['colorScheme'])
          : null,
      backgroundColor: json['backgroundColor'] != null
          ? backgroundThemeFromJson(json['backgroundColor'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'countryCode': countryCode,
      'phone': phone,
      'country': country,
      'gender': gender,
      'language': language,
      'mutedDirectMessages': mutedDirectMessages,
      'privateProfile': privateProfile,
      'colorScheme':
          colorScheme != null ? colorSchemeToJson(colorScheme!) : null,
      'backgroundColor': backgroundColor != null
          ? backgroundThemeToJson(backgroundColor!)
          : null,
    };
  }
}

ColorScheme colorSchemeFromJson(String json) {
  switch (json) {
    case 'BLUE':
      return ColorScheme.BLUE;
    case 'YELLOW':
      return ColorScheme.YELLOW;
    case 'CRIMSON':
      return ColorScheme.CRIMSON;
    case 'VIOLET':
      return ColorScheme.VIOLET;
    case 'ORANGE':
      return ColorScheme.ORANGE;
    case 'GREEN':
      return ColorScheme.GREEN;
    default:
      throw Exception('Unknown ColorScheme: $json');
  }
}

String colorSchemeToJson(ColorScheme colorScheme) {
  return colorScheme.toString().split('.').last;
}

BackgroundTheme backgroundThemeFromJson(String json) {
  switch (json) {
    case 'DEFAULT':
      return BackgroundTheme.DEFAULT;
    case 'DIM':
      return BackgroundTheme.DIM;
    case 'LIGHTS_OUT':
      return BackgroundTheme.LIGHTS_OUT;
    default:
      throw Exception('Unknown BackgroundTheme: $json');
  }
}

String backgroundThemeToJson(BackgroundTheme backgroundTheme) {
  return backgroundTheme.toString().split('.').last;
}
