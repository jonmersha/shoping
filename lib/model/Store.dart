class Store {
  List<Data>? data;

  Store({this.data});

  Store.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? owner;
  String? adress;
  String? geoLat;
  String? geoLong;

  Data(
      {this.id, this.name, this.owner, this.adress, this.geoLat, this.geoLong});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    owner = json['owner'];
    adress = json['adress'];
    geoLat = json['geo_lat'];
    geoLong = json['geo_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['owner'] = owner;
    data['adress'] = adress;
    data['geo_lat'] = geoLat;
    data['geo_long'] = geoLong;
    return data;
  }
}
