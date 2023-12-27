/// value : [{"@search.score":7.475915,"transporter_id":"IND000674","transporter_name":"MUMBAI SOUTHERN ROADWAYS PVT LTD","logo":""}]

class SearchResponseModel {
  SearchResponseModel({
    List<Value>? value,
  }) {
    _value = _value;
  }

  SearchResponseModel.fromJson(dynamic json) {
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(Value.fromJson(v));
      });
    }
  }
  List<Value>? _value;
  SearchResponseModel copyWith({
    List<Value>? value,
  }) =>
      SearchResponseModel(
        value: value ?? _value,
      );
  List<Value>? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_value != null) {
      map['value'] = _value?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// @search.score : 7.475915
/// transporter_id : "IND000674"
/// transporter_name : "MUMBAI SOUTHERN ROADWAYS PVT LTD"
/// logo : ""

class Value {
  Value({
    double? searchscore,
    String? transporterId,
    String? transporterName,
    String? logo,
  }) {
    _searchscore = searchscore;
    _transporterId = transporterId;
    _transporterName = transporterName;
    _logo = logo;
  }

  Value.fromJson(dynamic json) {
    _searchscore = json['@search.score'];
    _transporterId = json['transporter_id'];
    _transporterName = json['transporter_name'];
    _logo = json['logo'];
  }
  double? _searchscore;
  String? _transporterId;
  String? _transporterName;
  String? _logo;
  Value copyWith({
    double? searchscore,
    String? transporterId,
    String? transporterName,
    String? logo,
  }) =>
      Value(
        searchscore: searchscore ?? _searchscore,
        transporterId: transporterId ?? _transporterId,
        transporterName: transporterName ?? _transporterName,
        logo: logo ?? _logo,
      );
  double? get searchscore => _searchscore;
  String? get transporterId => _transporterId;
  String? get transporterName => _transporterName;
  String? get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['@search.score'] = _searchscore;
    map['transporter_id'] = _transporterId;
    map['transporter_name'] = _transporterName;
    map['logo'] = _logo;
    return map;
  }
}
