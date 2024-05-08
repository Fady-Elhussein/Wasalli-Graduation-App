class RegisterModel {
  String status;
  String message;
  RegisterUserData? user;

  RegisterModel({
    required this.status,
    required this.message,
    this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['message'],
      user:
          json['data'] != null ? RegisterUserData.fromJson(json['data']) : null,
    );
  }
}

class RegisterUserData {
  String? fName;
  String? lName;
  String? email;
  String? password;
  String? passwordConfirm;
  String? phoneNumber;
  String? nationalID;
  String? address;
  String? gender;
  String? role;

  RegisterUserData({
    this.fName,
    this.lName,
    this.email,
    this.password,
    this.passwordConfirm,
    this.phoneNumber,
    this.nationalID,
    this.address,
    this.gender,
    this.role,
  });

  factory RegisterUserData.fromJson(Map<String, dynamic> json) {
    return RegisterUserData(
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
