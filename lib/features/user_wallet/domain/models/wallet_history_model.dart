class WalletHistoryModel {
  final String hash;
  final double preBalance;
  final double postBalance;
  final String type;
  final String token;
  final double value;
  final String status;
  final String message;
  final double fee;
  final String? fromName;
  final String? toName;
  final DateTime createdAt;
  final String typeValue;

  WalletHistoryModel({
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

  factory WalletHistoryModel.fromJson(Map<String, dynamic> json) {
    return WalletHistoryModel(
      hash: json['hash'],
      preBalance: json['preBalance'].toDouble(),
      postBalance: json['postBalance'].toDouble(),
      type: json['type'],
      token: json['token'],
      value: json['value'].toDouble(),
      status: json['status'],
      message: json['message'],
      fee: json['fee'].toDouble(),
      fromName: json['fromName'],
      toName: json['toName'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      typeValue: json['typeValue'],
    );
  }

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
      'createdAt': createdAt.millisecondsSinceEpoch,
      'typeValue': typeValue,
    };
  }
}
