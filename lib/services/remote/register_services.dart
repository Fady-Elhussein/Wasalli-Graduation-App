import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class RegisterServices {
 
  Future<Map<String, dynamic>> postData({
    required String fName,
    required String lName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String phoneNumber,
    required String nationalId,
    required String address,
    required String gender,
    required String role,
  }) async {
   

    try {
      Response response = await dio.post(signupEndPoint, data: {
        "fName": fName,
        "lName": lName,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
        "phoneNumber": phoneNumber,
        "address": address,
        "national_ID": nationalId,
        "gender": gender,
        "role": role,
      });
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
