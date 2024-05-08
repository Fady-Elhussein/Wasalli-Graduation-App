import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class DeliveredOrderServices {
  
  Future<Map<String, dynamic>> putOrderInDelivered({
    required String orderId,
    required String token,
  }) async {
    try {
      Response response = await dio.put(
        '$putOrderInDeliveredDeliveryEndPoint$orderId',
        queryParameters: {'status': 'Delivered'},
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
