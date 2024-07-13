class Product {
  List<Data>? data;

  Product({this.data});

  Product.fromJson(Map<String, dynamic> json) {
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
  int? category;
  String? descriptions;
  int? merchantId;
  int? quantity;
  String? unitsOfMeasure;
  int? unitPrice;
  int? minTreshhold;
  int? profitMargin;
  int? discountedPercentage;
  String? imagePath;

  Data(
      {this.id,
        this.category,
        this.descriptions,
        this.merchantId,
        this.quantity,
        this.unitsOfMeasure,
        this.unitPrice,
        this.minTreshhold,
        this.profitMargin,
        this.discountedPercentage,
        this.imagePath});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    descriptions = json['descriptions'];
    merchantId = json['merchant_id'];
    quantity = json['quantity'];
    unitsOfMeasure = json['units_of_measure'];
    unitPrice = json['unit_price'];
    minTreshhold = json['min_treshhold'];
    profitMargin = json['profit_margin'];
    discountedPercentage = json['discounted_percentage'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['descriptions'] = this.descriptions;
    data['merchant_id'] = this.merchantId;
    data['quantity'] = this.quantity;
    data['units_of_measure'] = this.unitsOfMeasure;
    data['unit_price'] = this.unitPrice;
    data['min_treshhold'] = this.minTreshhold;
    data['profit_margin'] = this.profitMargin;
    data['discounted_percentage'] = this.discountedPercentage;
    data['image_path'] = this.imagePath;
    return data;
  }
}
