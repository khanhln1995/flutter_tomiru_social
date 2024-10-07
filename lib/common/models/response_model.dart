class ResponseModel {
  final bool _isSuccess;
  final String? _message;
  List<int>? zoneIds;
  ResponseModel(this._isSuccess, this._message, {this.zoneIds});

  String? get message => _message;
  bool get isSuccess => _isSuccess;
}

class ResponseModelWithBody {
  final bool _isSuccess;
  final String? _message;
  final Map<String, dynamic>? _body;

  ResponseModelWithBody(this._isSuccess, this._message, this._body);

  String? get message => _message;
  bool get isSuccess => _isSuccess;
  Map<String, dynamic>? get body => _body;
}
