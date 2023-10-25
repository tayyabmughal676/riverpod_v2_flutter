/// page : 2
/// per_page : 6
/// total : 12
/// total_pages : 2
/// data : [{"id":7,"email":"michael.lawson@reqres.in","first_name":"Michael","last_name":"Lawson","avatar":"https://reqres.in/img/faces/7-image.jpg"},{"id":8,"email":"lindsay.ferguson@reqres.in","first_name":"Lindsay","last_name":"Ferguson","avatar":"https://reqres.in/img/faces/8-image.jpg"},{"id":9,"email":"tobias.funke@reqres.in","first_name":"Tobias","last_name":"Funke","avatar":"https://reqres.in/img/faces/9-image.jpg"},{"id":10,"email":"byron.fields@reqres.in","first_name":"Byron","last_name":"Fields","avatar":"https://reqres.in/img/faces/10-image.jpg"},{"id":11,"email":"george.edwards@reqres.in","first_name":"George","last_name":"Edwards","avatar":"https://reqres.in/img/faces/11-image.jpg"},{"id":12,"email":"rachel.howell@reqres.in","first_name":"Rachel","last_name":"Howell","avatar":"https://reqres.in/img/faces/12-image.jpg"}]
/// support : {"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}

class UserModel {
  UserModel({
    num? page,
    num? perPage,
    num? total,
    num? totalPages,
    List<Data>? data,
    Support? support,
  }) {
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _data = data;
    _support = support;
  }

  UserModel.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _support =
        json['support'] != null ? Support.fromJson(json['support']) : null;
  }

  num? _page;
  num? _perPage;
  num? _total;
  num? _totalPages;
  List<Data>? _data;
  Support? _support;

  UserModel copyWith({
    num? page,
    num? perPage,
    num? total,
    num? totalPages,
    List<Data>? data,
    Support? support,
  }) =>
      UserModel(
        page: page ?? _page,
        perPage: perPage ?? _perPage,
        total: total ?? _total,
        totalPages: totalPages ?? _totalPages,
        data: data ?? _data,
        support: support ?? _support,
      );

  num? get page => _page;

  num? get perPage => _perPage;

  num? get total => _total;

  num? get totalPages => _totalPages;

  List<Data>? get data => _data;

  Support? get support => _support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_support != null) {
      map['support'] = _support?.toJson();
    }
    return map;
  }
}

/// url : "https://reqres.in/#support-heading"
/// text : "To keep ReqRes free, contributions towards server costs are appreciated!"

class Support {
  Support({
    String? url,
    String? text,
  }) {
    _url = url;
    _text = text;
  }

  Support.fromJson(dynamic json) {
    _url = json['url'];
    _text = json['text'];
  }

  String? _url;
  String? _text;

  Support copyWith({
    String? url,
    String? text,
  }) =>
      Support(
        url: url ?? _url,
        text: text ?? _text,
      );

  String? get url => _url;

  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['text'] = _text;
    return map;
  }
}

/// id : 7
/// email : "michael.lawson@reqres.in"
/// first_name : "Michael"
/// last_name : "Lawson"
/// avatar : "https://reqres.in/img/faces/7-image.jpg"

class Data {
  Data({
    num? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }

  num? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;

  Data copyWith({
    num? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) =>
      Data(
        id: id ?? _id,
        email: email ?? _email,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        avatar: avatar ?? _avatar,
      );

  num? get id => _id;

  String? get email => _email;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['avatar'] = _avatar;
    return map;
  }
}
