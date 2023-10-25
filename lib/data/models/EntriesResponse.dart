class EntriesResponse {
  EntriesResponse({
    num? count,
    List<Entries>? entries,
  }) {
    _count = count;
    _entries = entries;
  }

  EntriesResponse.fromJson(dynamic json) {
    _count = json['count'];
    if (json['entries'] != null) {
      _entries = [];
      json['entries'].forEach((v) {
        _entries?.add(Entries.fromJson(v));
      });
    }
  }

  num? _count;
  List<Entries>? _entries;

  EntriesResponse copyWith({
    num? count,
    List<Entries>? entries,
  }) =>
      EntriesResponse(
        count: count ?? _count,
        entries: entries ?? _entries,
      );

  num? get count => _count;

  List<Entries>? get entries => _entries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_entries != null) {
      map['entries'] = _entries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// API : "AdoptAPet"
/// Description : "Resource to help get pets adopted"
/// Auth : "apiKey"
/// HTTPS : true
/// Cors : "yes"
/// Link : "https://www.adoptapet.com/public/apis/pet_list.html"
/// Category : "Animals"

class Entries {
  Entries({
    String? api,
    String? description,
    String? auth,
    bool? https,
    String? cors,
    String? link,
    String? category,
  }) {
    _api = api;
    _description = description;
    _auth = auth;
    _https = https;
    _cors = cors;
    _link = link;
    _category = category;
  }

  Entries.fromJson(dynamic json) {
    _api = json['API'];
    _description = json['Description'];
    _auth = json['Auth'];
    _https = json['HTTPS'];
    _cors = json['Cors'];
    _link = json['Link'];
    _category = json['Category'];
  }

  String? _api;
  String? _description;
  String? _auth;
  bool? _https;
  String? _cors;
  String? _link;
  String? _category;

  Entries copyWith({
    String? api,
    String? description,
    String? auth,
    bool? https,
    String? cors,
    String? link,
    String? category,
  }) =>
      Entries(
        api: api ?? _api,
        description: description ?? _description,
        auth: auth ?? _auth,
        https: https ?? _https,
        cors: cors ?? _cors,
        link: link ?? _link,
        category: category ?? _category,
      );

  String? get api => _api;

  String? get description => _description;

  String? get auth => _auth;

  bool? get https => _https;

  String? get cors => _cors;

  String? get link => _link;

  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['API'] = _api;
    map['Description'] = _description;
    map['Auth'] = _auth;
    map['HTTPS'] = _https;
    map['Cors'] = _cors;
    map['Link'] = _link;
    map['Category'] = _category;
    return map;
  }
}
