/// activity : "Patronize a local independent restaurant"
/// type : "recreational"
/// participants : 1
/// price : 0.2
/// link : ""
/// key : "5319204"
/// accessibility : 0.1

class ActivityResponse {
  ActivityResponse({
    String? activity,
    String? type,
    num? participants,
    num? price,
    String? link,
    String? key,
    num? accessibility,
  }) {
    _activity = activity;
    _type = type;
    _participants = participants;
    _price = price;
    _link = link;
    _key = key;
    _accessibility = accessibility;
  }

  ActivityResponse.fromJson(dynamic json) {
    _activity = json['activity'];
    _type = json['type'];
    _participants = json['participants'];
    _price = json['price'];
    _link = json['link'];
    _key = json['key'];
    _accessibility = json['accessibility'];
  }

  String? _activity;
  String? _type;
  num? _participants;
  num? _price;
  String? _link;
  String? _key;
  num? _accessibility;

  ActivityResponse copyWith({
    String? activity,
    String? type,
    num? participants,
    num? price,
    String? link,
    String? key,
    num? accessibility,
  }) =>
      ActivityResponse(
        activity: activity ?? _activity,
        type: type ?? _type,
        participants: participants ?? _participants,
        price: price ?? _price,
        link: link ?? _link,
        key: key ?? _key,
        accessibility: accessibility ?? _accessibility,
      );

  String? get activity => _activity;

  String? get type => _type;

  num? get participants => _participants;

  num? get price => _price;

  String? get link => _link;

  String? get key => _key;

  num? get accessibility => _accessibility;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = _activity;
    map['type'] = _type;
    map['participants'] = _participants;
    map['price'] = _price;
    map['link'] = _link;
    map['key'] = _key;
    map['accessibility'] = _accessibility;
    return map;
  }
}
