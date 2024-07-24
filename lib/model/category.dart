class Category {
  List<Data>? data;

  Category({this.data});

  Category.fromJson(Map<String, dynamic> json) {
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
  String? description;
  int? status;
  String? imagename;

  Data(
      {this.id,
        this.name,
        this.merchantId,
        this.description,
        this.status,
        this.imagename});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    merchantId = json['merchant_id'];
    description = json['description'];
    status = json['status'];
    imagename = json['imagename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['merchant_id'] = merchantId;
    data['description'] = description;
    data['status'] = status;
    data['imagename'] = imagename;
    return data;
  }
}
