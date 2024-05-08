import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class DeletSOrderServices {
 Future<Map<String, dynamic>> deletSOrderServices({
    required String token,
    required String orderID,
  }) async {
    try {
      Response response = await dio.put(
        '$deletOrderEndPoint/$orderID',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
