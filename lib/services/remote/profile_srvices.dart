import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class ProfileServices {

  Future<Map<String, dynamic>> getProfileData(
      {required String token, }) async {
    try {
      Response response = await dio.get(getProfileEndPoint,  options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));
      return response.data;
    } on DioException catch (e) {
      
      return e.response!.data;
    }
  }
}
