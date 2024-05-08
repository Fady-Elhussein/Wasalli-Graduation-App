import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/sender_cubits/inprogress_order/inprogress_order_state.dart';
import 'package:wasili/model/sender_models/inprogress_model.dart';
import 'package:wasili/services/remote/sender_services/inprogress_order_services.dart';

class InprogressOrderCubit extends Cubit<InprogressOrderStates> {
  InprogressOrderCubit() : super(InprogressOrderInitialState());

  InProgressOrderModel? inProgressOrderModel;
  void getAllInProgressOrder({required String token}) {
    try {
      emit(InprogressOrderLoadingState());
      InProgressOrderServices()
          .getAllInProgressOrder(
        token: token,
      )
          .then((value) {
        print(value);

        inProgressOrderModel = InProgressOrderModel.fromJson(value);
        emit(InprogressOrderSuccessState());
      }).catchError((error) {
        print(error);
        emit(InprogressOrderFailedState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
