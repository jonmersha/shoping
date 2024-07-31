class StockBin {
  List<Data>? data;

  StockBin({this.data});

  StockBin.fromJson(Map<String, dynamic> json) {
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
  int? productId;
  int? previousQuantity;
  int? currentQuantity;
  int? stockBalance;
  int? merchantId;
  int? storeId;
  int? previousPrice;
  int? currentPrice;
  String? regDate;
  int? registeredBy;

  Data(
      {this.id,
        this.productId,
        this.previousQuantity,
        this.currentQuantity,
        this.stockBalance,
        this.merchantId,
        this.storeId,
        this.previousPrice,
        this.currentPrice,
        this.regDate,
        this.registeredBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    previousQuantity = json['previous_quantity'];
    currentQuantity = json['current_quantity'];
    stockBalance = json['stock_balance'];
    merchantId = json['merchant_id'];
    storeId = json['store_id'];
    previousPrice = json['previous_price'];
    currentPrice = json['current_price'];
    regDate = json['reg_date'];
    registeredBy = json['registered_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['previous_quantity'] = previousQuantity;
    data['current_quantity'] = currentQuantity;
    data['stock_balance'] = stockBalance;
    data['merchant_id'] = merchantId;
    data['store_id'] = storeId;
    data['previous_price'] = previousPrice;
    data['current_price'] = currentPrice;
    data['reg_date'] = regDate;
    data['registered_by'] = registeredBy;
    return data;
  }
}
