class EditUserRequest {
  final String? fullName;
  final String? birthday;
  final String? avatar;
  final String? wallpaper;
  final String? about;
  final String? gender;
  final String? phone;

  EditUserRequest({
    this.fullName,
    this.birthday,
    this.avatar,
    this.wallpaper,
    this.about,
    this.gender,
    this.phone,
  });

  factory EditUserRequest.fromJson(Map<String, dynamic> json) {
    return EditUserRequest(
      fullName: json['fullName'],
      birthday: json['birthday'],
      avatar: json['avatar'],
      wallpaper: json['wallpaper'],
      about: json['about'],
      gender: json['gender'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'birthday': birthday,
      'avatar': avatar,
      'wallpaper': wallpaper,
      'about': about,
      'gender': gender,
      'phone': phone,
    };
  }
}
