class MerchantStore {
  List<Data>? data;

  MerchantStore({this.data});

  MerchantStore.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['merchant_id'] = merchantId;
    data['adress'] = adress;
    data['geo_lat'] = geoLat;
    data['geo_long'] = geoLong;
    return data;
  }
}
