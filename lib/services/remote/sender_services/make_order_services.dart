import 'package:dio/dio.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/remote/api_services.dart';

class MakeOredrServices {
 

  Future<Map<String, dynamic>> postOrder({
    required String shipmentName,
    required String from,
    required String to,
    required String shipmentPrice,
    required String deliveryCost,
    required String recipientPhoneNumber,
    String? alternateSenderPhoneNumber,
    String? comment,
    required String token,
  }) async {
    try {
      Response response = await dio.post(makeOrdersEndPoint,
          data: {
            "shipmentName": shipmentName,
            "from": from,
            "to": to,
            "shipmentPrice": shipmentPrice,
            "deliveryCost": deliveryCost,
            "recipientPhoneNumber": recipientPhoneNumber,
            
            "comment": comment??'',
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
