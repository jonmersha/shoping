class Product {
  List<Data>? data;
  Product({this.data});

  Product.fromJson(Map<String, dynamic> json) {
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
  int? category;
  String? productName;
  String? descriptions;
  int? merchantId;
  int? quantity;
  String? unitsOfMeasure;
  int? unitPrice;
  int? minThreshold;
  int? profitMargin;
  int? discountedPercentage;
  String? imagePath;
  Data(
      {this.id,
        this.category,
        this.productName,
        this.descriptions,
        this.merchantId,
        this.quantity,
        this.unitsOfMeasure,
        this.unitPrice,
        this.minThreshold,
        this.profitMargin,
        this.discountedPercentage,
        this.imagePath});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    productName = json['product_name'];
    descriptions = json['descriptions'];
    merchantId = json['merchant_id'];
    quantity = json['quantity'];
    unitsOfMeasure = json['units_of_measure'];
    unitPrice = json['unit_price'];
    minThreshold = json['min_threshold'];
    profitMargin = json['profit_margin'];
    discountedPercentage = json['discounted_percentage'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['product_name'] = productName;
    data['descriptions'] = descriptions;
    data['merchant_id'] = merchantId;
    data['quantity'] = quantity;
    data['units_of_measure'] = unitsOfMeasure;
    data['unit_price'] = unitPrice;
    data['min_threshold'] = minThreshold;
    data['profit_margin'] = profitMargin;
    data['discounted_percentage'] = discountedPercentage;
    data['image_path'] = imagePath;
    return data;
  }
}
