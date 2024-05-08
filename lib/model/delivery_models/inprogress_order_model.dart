class InProgressOrderModel {
  String? status;
  String? message;
  int? result;
  List<Data>? data;

  InProgressOrderModel({this.status, this.message, this.result, this.data});

  factory InProgressOrderModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List<dynamic>?;

    return InProgressOrderModel(
      status: json['status'],
      message: json['message'],
      result: json['result'],
      data: dataList?.map((e) => Data.fromJson(e)).toList(),
    );
  }
}

class Data {
  String? orderId;
  String? shipmentName;
  String? from;
  String? to;
  String? shipmentPrice;
  String? deliveryCost;
  String? recipientPhoneNumber;
  String? alternateSenderPhoneNumber;
  String? comment;
  Sender? sender;
  String? status;
  String? createdAt;
  String? updatedAt;
  Delivery? delivery;

  Data({
    this.orderId,
    this.shipmentName,
    this.from,
    this.to,
    this.shipmentPrice,
    this.deliveryCost,
    this.recipientPhoneNumber,
    this.alternateSenderPhoneNumber,
    this.comment,
    this.sender,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.delivery,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      orderId: json['_id'],
      shipmentName: json['shipmentName'],
      from: json['from'],
      to: json['to'],
      shipmentPrice: json['shipmentPrice'],
      deliveryCost: json['deliveryCost'],
      recipientPhoneNumber: json['recipientPhoneNumber'],
      alternateSenderPhoneNumber: json['alternateSenderPhoneNumber'],
      comment: json['comment'],
      sender: json['sender'] != null ? Sender.fromJson(json['sender']) : null,
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      delivery:
          json['delivery'] != null ? Delivery.fromJson(json['delivery']) : null,
    );
  }
}

class Sender {
  String? orderId;
  String? fName;
  String? lName;
  String? email;
  String? password;
  String? phoneNumber;
  String? nationalID;
  String? address;
  String? gender;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Sender({
    this.orderId,
    this.fName,
    this.lName,
    this.email,
    this.password,
    this.phoneNumber,
    this.nationalID,
    this.address,
    this.gender,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      orderId: json['_id'],
      fName: json['fName'],
      lName: json['lName'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      nationalID: json['national_ID'],
      address: json['address'],
      gender: json['gender'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }
}

class Delivery {
  String? orderId;
  String? fName;
  String? lName;
  String? email;
  String? phoneNumber;
  String? nationalID;
  String? address;
  String? gender;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Delivery({
    this.orderId,
    this.fName,
    this.lName,
    this.email,
    this.phoneNumber,
    this.nationalID,
    this.address,
    this.gender,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      orderId: json['_id'],
      fName: json['fName'],
      lName: json['lName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      nationalID: json['national_ID'],
      address: json['address'],
      gender: json['gender'],
      role: json['role'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }
}
