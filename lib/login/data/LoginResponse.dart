/// $id : "1"
/// code : 0
/// message : "success"
/// data : {"$id":"2","Id":7075,"Name":"Developer","Email":"Developer5@gmail.com","Token":"3030401c-c5a5-43c8-8b73-2ab9e6f2ca22"}

class LoginResponse {
  LoginResponse({
      String? id, 
      int? code, 
      String? message, 
      Data? data,}){
    _id = id;
    _code = code;
    _message = message;
    _data = data;
}

  LoginResponse.fromJson(dynamic json) {
    _id = json['$id'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _id;
  int? _code;
  String? _message;
  Data? _data;

  String? get id => _id;
  int? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$id'] = _id;
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// $id : "2"
/// Id : 7075
/// Name : "Developer"
/// Email : "Developer5@gmail.com"
/// Token : "3030401c-c5a5-43c8-8b73-2ab9e6f2ca22"

class Data {
  Data({
      String? id, 

      String? name, 
      String? email, 
      String? token,}){
    _id = id;
    _name = name;
    _email = email;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _id = json['$id'];
    _name = json['Name'];
    _email = json['Email'];
    _token = json['Token'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _token;

  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$id'] = _id;
    map['Id'] = _id;
    map['Name'] = _name;
    map['Email'] = _email;
    map['Token'] = _token;
    return map;
  }

}