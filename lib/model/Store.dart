class MerchantStore {
  List<Data>? data;

  MerchantStore({this.data});

  MerchantStore.fromJson(Map<String, dynamic> json) {
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
  int? merchantId;
  String? adress;
  String? geoLat;
  String? geoLong;

  Data(
      {this.id,
        this.name,
        this.merchantId,
        this.adress,
        this.geoLat,
        this.geoLong});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    merchantId = json['merchant_id'];
    adress = json['adress'];
    geoLat = json['geo_lat'];
    geoLong = json['geo_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['merchant_id'] = this.merchantId;
    data['adress'] = this.adress;
    data['geo_lat'] = this.geoLat;
    data['geo_long'] = this.geoLong;
    return data;
  }
}
