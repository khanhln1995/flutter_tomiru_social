class SignUpBodyModel {
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;
  String? refCode;
  String? username;
  String? gender;

  SignUpBodyModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email = '',
      this.password,
      this.refCode = '',
      this.username,
      this.gender});

  SignUpBodyModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    refCode = json['refCode'];
    username = json['username'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['refCode'] = refCode;
    data['username'] = username;
    data['gender'] = gender;
    return data;
  }
}
