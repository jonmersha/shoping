class Category {
  List<Data>? data;

  Category({this.data});

  Category.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['merchant_id'] = this.merchantId;
    data['status'] = this.status;
    data['image_name'] = this.imageName;
    return data;
  }
}
