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
  String? description;
  int? merchantId;
  int? status;
  String? imageName;

  Data(
      {this.id,
        this.name,
        this.description,
        this.merchantId,
        this.status,
        this.imageName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    merchantId = json['merchant_id'];
    status = json['status'];
    imageName = json['image_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['merchant_id'] = merchantId;
    data['status'] = status;
    data['image_name'] = imageName;
    return data;
  }
}
