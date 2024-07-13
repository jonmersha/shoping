class Store {
  List<Data>? data;

  Store({this.data});

  Store.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? address;
  String? geoLat;
  String? geoLong;

  Data(
      {this.id, this.name, this.owner, this.address, this.geoLat, this.geoLong});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    owner = json['owner'];
    address = json['adress'];
    geoLat = json['geo_lat'];
    geoLong = json['geo_long'];
  }
  // git init
  // git add README.md
  // git commit -m "first commit"
  // git branch -M main
  // git remote add origin https://github.com/jonmersha/shoping.git
  // git push -u origin main
  // Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['adress'] = this.address;
    data['geo_lat'] = this.geoLat;
    data['geo_long'] = this.geoLong;
    return data;
  }
}
