class AvailableOrderModel {
  String? status;
  String? message;
  int? result;
  List<Data>? data;

  AvailableOrderModel({this.status, this.message, this.result, this.data});

  factory AvailableOrderModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List<dynamic>?;

    return AvailableOrderModel(
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
  String? sendingDate;
  String? status;

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
    this.sendingDate,
    this.status,
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
    );
  }
}

class Sender {
  String? sId;
  String? fName;
  String? lName;
  String? email;
  String? password;
  String? phoneNumber;
  String? nationalID;
  String? address;
  String? gender;
  String? role;

  Sender({
    this.sId,
    this.fName,
    this.lName,
    this.email,
    this.password,
    this.phoneNumber,
    this.nationalID,
    this.address,
    this.gender,
    this.role,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      sId: json['_id'],
      fName: json['fName'],
      lName: json['lName'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      nationalID: json['national_ID'],
      address: json['address'],
      gender: json['gender'],
      role: json['role'],
    );
  }
}
