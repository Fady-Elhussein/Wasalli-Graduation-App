import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class AvailableOrderServices {

  Future<Map<String, dynamic>> getAllAvailableOrder({
    required String token,
  }) async {
    try {
      Response response = await dio.get(availableOrderDeliveryEndPoint,
          queryParameters: {'status': 'Pending'},
          options: Options(
            headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }));
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
