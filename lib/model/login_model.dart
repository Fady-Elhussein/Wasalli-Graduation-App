class LoginModel {
  String status;
  String message;
  String? token;
  LoginUserData? user;
  LoginModel({
    required this.status,
    required this.message,
    this.token,
    this.user,
  });
  factory LoginModel.fromjson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      token: json['token'],
      user: json['data'] != null ? LoginUserData.fromjson(json['data']) : null,
    );
  }
}

class LoginUserData {
  String? id;
  String? fName;
  String? lName;
  String? email;
  String? password;
  String? phoneNumber;
  String? nationalID;
  String? address;
  String? gender;
  String? role;

  LoginUserData({
    this.id,
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
  factory LoginUserData.fromjson(Map<String, dynamic> json) {
    return LoginUserData(
      id: json['_id'],
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
