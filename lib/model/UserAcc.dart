class User {
  List<Data>? data;

  User({this.data});

  User.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['merchant_id'] = merchantId;
    data['uid'] = uid;
    data['phone'] = phone;
    data['login_token'] = loginToken;
    data['user_email'] = userEmail;
    data['full_name'] = fullName;
    data['user_type'] = userType;
    return data;
  }
}
