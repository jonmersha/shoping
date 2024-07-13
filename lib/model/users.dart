class Users {
  List<Data>? data;

  Users({this.data});

  Users.fromJson(Map<String, dynamic> json) {
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
  int? iD;
  String? token;
  String? email;
  String? firstName;
  String? lastName;
  String? deviceId;

  Data(
      {this.iD,
        this.token,
        this.email,
        this.firstName,
        this.lastName,
        this.deviceId});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    token = json['token'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['token'] = token;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['device_id'] = deviceId;
    return data;
  }
}
