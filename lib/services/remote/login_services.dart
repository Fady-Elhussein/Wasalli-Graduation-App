import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class LoginServices {

  Future<Map<String, dynamic>> postData(
      {required String nationalID, required String password}) async {
    try {
      Response response = await dio.post(loginEndPoint, data: {
        'national_ID': nationalID,
        'password': password,
      });
      return response.data;
    } on DioException catch (e) {

      return e.response!.data;
    }
  }
}
