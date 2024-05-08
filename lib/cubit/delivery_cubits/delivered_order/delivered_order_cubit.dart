import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/delivery_cubits/delivered_order/delivered_order_state.dart';
import 'package:wasili/services/remote/delivery_services/delivered_order_services.dart';

class DeliveredOrderCubit extends Cubit<DeliveredOrderStates> {
  DeliveredOrderCubit() : super(DeliveredOrderInitialState());

 void putOrderInDelivered({required String token, required String orderId}) {
    try {
      emit(DeliveredOrderLoadingState());
      DeliveredOrderServices()
          .putOrderInDelivered(
        orderId: orderId,
        token: token,
      )
          .then((value) {
        print(value);
        emit(DeliveredOrderSuccessState());
      }).catchError((error) {
        print(error);
        emit(DeliveredOrderFailedState());
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
