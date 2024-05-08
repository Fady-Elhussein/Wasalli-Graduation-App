import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class UpdateProfileServices {
  Future<Map<String, dynamic>> updateProfile({
    required String token,
    required String fName,
    required String lName,
    required String phoneNumber,
    required String address,
  }) async {
    try {
      Response response = await dio.put(getProfileEndPoint,
          data: {
            "fName": fName,
            "lName": lName,
            "phoneNumber": phoneNumber,
            "address": address,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
