class MakeOrderModel {
  String? status;
  String? message;
  OrderData? orderData;

  MakeOrderModel({this.status, this.message, this.orderData});

  factory MakeOrderModel.fromJson(Map<String, dynamic> json) {
    return MakeOrderModel(
      status: json['status'],
      message: json['message'],
      orderData: json['data'] != null ? OrderData.fromJson(json['data']) : null,
    );
  }
}

class OrderData {
  String? shipmentName;
  String? from;
  String? to;
  String? shipmentPrice;
  String? deliveryCost;
  String? recipientPhoneNumber;
  String? alternateSenderPhoneNumber;
  String? comment;
  OredrSender? sender;
  String? status;

  OrderData({
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
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      shipmentName: json['shipmentName'],
      from: json['from'],
      to: json['to'],
      shipmentPrice: json['shipmentPrice'],
      deliveryCost: json['deliveryCost'],
      recipientPhoneNumber: json['recipientPhoneNumber'],
      alternateSenderPhoneNumber: json['alternateSenderPhoneNumber'],
      comment: json['comment'],
      sender:
          json['sender'] != null ? OredrSender.fromJson(json['sender']) : null,
      status: json['Pending'],
    );
  }
}

class OredrSender {
  String? fName;
  String? lName;
  String? phoneNumber;
  String? nationalID;

  String? role;
  OredrSender({
    this.fName,
    this.lName,
    this.phoneNumber,
    this.nationalID,
    this.role,
  });
  factory OredrSender.fromJson(Map<String, dynamic> json) {
    return OredrSender(
        fName: json['fName'],
        lName: json['lName'],
        phoneNumber: json['phoneNumber'],
        nationalID: json['national_ID'],
        role: json['role']);
  }
}
