

class WalletInfo {
  final String hash;
  final int preBalance;
  final int postBalance;
  final String type;
  final String token;
  final int value;
  final String status;
  final String message;
  final int fee;
  final String? fromName;
  final String? toName;
  final int createdAt;
  final String typeValue;

  WalletInfo({
    required this.hash,
    required this.preBalance,
    required this.postBalance,
    required this.type,
    required this.token,
    required this.value,
    required this.status,
    required this.message,
    required this.fee,
    this.fromName,
    this.toName,
    required this.createdAt,
    required this.typeValue,
  });

  // Factory constructor to create a WalletInfo instance from a JSON map
  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      hash: json['hash'],
      preBalance: json['preBalance'],
      postBalance: json['postBalance'],
      type: json['type'],
      token: json['token'],
      value: json['value'],
      status: json['status'],
      message: json['message'],
      fee: json['fee'],
      fromName: json['fromName'],
      toName: json['toName'],
      createdAt: json['createdAt'],
      typeValue: json['typeValue'],
    );
  }

  // Convert a WalletInfo instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'preBalance': preBalance,
      'postBalance': postBalance,
      'type': type,
      'token': token,
      'value': value,
      'status': status,
      'message': message,
      'fee': fee,
      'fromName': fromName,
      'toName': toName,
      'createdAt': createdAt,
      'typeValue': typeValue,
    };
  }
}
