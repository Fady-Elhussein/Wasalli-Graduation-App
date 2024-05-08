import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/sender_cubits/delet_order/cubit/delet_order_state.dart';
import 'package:wasili/services/remote/sender_services/delet_oreder_services.dart';

class DeletOrderCubit extends Cubit<DeletOrderStates> {
  DeletOrderCubit() : super(DeletOrderInitialState());

  Future deletOrder({
    required String token,
    required String orderID,
  }) async{
    try {
              emit(DeletOrderLoadingState());

    await  DeletSOrderServices()
          .deletSOrderServices(token: token, orderID: orderID)
          .then((value) {
        print(value);

        emit(DeletOrderSuccessState());
      }).catchError((error) {
        print(error);
        emit(DeletOrderFailedState());
        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
