import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class SupportServices {
  
  Future<Map<String, dynamic>> postSupportMessage(
      {required String name,
      required String email,
      required String phoneNumber,
      required String message,
      required String token,}) async {
    try {
      Response response = await dio.post(messagesEndPoint, data: {
        'name': name,
        'email': email,
        "phoneNumber": phoneNumber,
        "message": message
      },  options: Options(headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
