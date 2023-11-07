/// answer : "To some extend, yes!"
/// user : {"display_name":"mehrdad","username":"hamid","avatar":"avatar"}

class ResponseModel {
  ResponseModel({
      String? answer, 
      User? user,}){
    _answer = answer;
    _user = user;
}

  ResponseModel.fromJson(dynamic json) {
    _answer = json['answer'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _answer;
  User? _user;
ResponseModel copyWith({  String? answer,
  User? user,
}) => ResponseModel(  answer: answer ?? _answer,
  user: user ?? _user,
);
  String? get answer => _answer;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = _answer;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// display_name : "mehrdad"
/// username : "hamid"
/// avatar : "avatar"

class User {
  User({
      String? displayName, 
      String? username, 
      String? avatar,}){
    _displayName = displayName;
    _username = username;
    _avatar = avatar;
}

  User.fromJson(dynamic json) {
    _displayName = json['display_name'];
    _username = json['username'];
    _avatar = json['avatar'];
  }
  String? _displayName;
  String? _username;
  String? _avatar;
User copyWith({  String? displayName,
  String? username,
  String? avatar,
}) => User(  displayName: displayName ?? _displayName,
  username: username ?? _username,
  avatar: avatar ?? _avatar,
);
  String? get displayName => _displayName;
  String? get username => _username;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['display_name'] = _displayName;
    map['username'] = _username;
    map['avatar'] = _avatar;
    return map;
  }

}