class ErrorResponse {
  List<Errors> _error;

  List<Errors> get errors => _error;

  ErrorResponse({List<Errors> errors}) {
    _error = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    if (json['error'] != null) {
      _error = [];
      json['errors'].forEach((v) {
        _error.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_error != null) {
      map['errors'] = _error.map((e) => e.toJson()).toList();
    }
  }
}

class Errors {
  String _code;
  String _message;

  String get code => _code;

  String get message => _message;

  Errors({String code, String message}) {
    _code = code;
    _message = message;
  }

  Errors.fromJson(dynamic json){
    _code = json['code'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
  }
}
