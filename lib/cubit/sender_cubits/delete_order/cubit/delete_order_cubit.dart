import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/sender_cubits/delete_order/cubit/delete_order_state.dart';
import 'package:wasili/services/remote/sender_services/delet_oreder_services.dart';

class DeleteOrderCubit extends Cubit<DeleteOrderStates> {
  DeleteOrderCubit() : super(DeleteOrderInitialState());

  Future deletOrder({
    required String token,
    required String orderID,
  }) async{
    try {
              emit(DeleteOrderLoadingState());

    await  DeletSOrderServices()
          .deletSOrderServices(token: token, orderID: orderID)
          .then((value) {
        print(value);

        emit(DeleteOrderSuccessState());
      }).catchError((error) {
        print(error);
        emit(DeleteOrderFailedState());
        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
