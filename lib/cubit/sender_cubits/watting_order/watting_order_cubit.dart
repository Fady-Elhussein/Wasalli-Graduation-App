import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/sender_cubits/watting_order/watting_order_state.dart';
import 'package:wasili/model/sender_models/waiting_order_model.dart';
import 'package:wasili/services/remote/sender_services/waitting_order_services.dart';

class WattingOrderCubit extends Cubit<WattingOrderStates> {
  WattingOrderCubit() : super(WattingOrderInitialState());
  WaitingOrderModel? waitingOrderModel;
  void getAllWattingOrder({required String token}) {
    try {
      emit(WattingOrderLoadingState());
      WattingOrderServices()
          .getAllWattingOrder(
        token: token,
      )
          .then((value) {
        print(value);

        waitingOrderModel = WaitingOrderModel.fromJson(value);
        emit(WattingOrderSuccessState());
      }).catchError((error) {
        print(error);
        emit(WattingOrderFailedState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
