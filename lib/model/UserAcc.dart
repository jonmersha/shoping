class User {
  List<Data>? data;

  User({this.data});

  User.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? merchantId;
  String? uid;
  String? phone;
  String? loginToken;
  String? userEmail;
  String? fullName;
  int? userType;

  Data(
      {this.userId,
        this.merchantId,
        this.uid,
        this.phone,
        this.loginToken,
        this.userEmail,
        this.fullName,
        this.userType});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    merchantId = json['merchant_id'];
    uid = json['uid'];
    phone = json['phone'];
    loginToken = json['login_token'];
    userEmail = json['user_email'];
    fullName = json['full_name'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['merchant_id'] = this.merchantId;
    data['uid'] = this.uid;
    data['phone'] = this.phone;
    data['login_token'] = this.loginToken;
    data['user_email'] = this.userEmail;
    data['full_name'] = this.fullName;
    data['user_type'] = this.userType;
    return data;
  }
}
