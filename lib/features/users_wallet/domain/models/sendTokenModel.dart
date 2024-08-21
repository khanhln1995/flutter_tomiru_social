class SendTokenModel {
  final int value;
  final String codeOtp;
  final String email;
  final String message;

  SendTokenModel({
    required this.value,
    required this.codeOtp,
    required this.email,
    required this.message,
  });

  factory SendTokenModel.fromJson(Map<String, dynamic> json) {
    return SendTokenModel(
      value: json['value'],
      codeOtp: json['codeOtp'],
      email: json['email'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'codeOtp': codeOtp,
      'email': email,
      'message': message,
    };
  }
}