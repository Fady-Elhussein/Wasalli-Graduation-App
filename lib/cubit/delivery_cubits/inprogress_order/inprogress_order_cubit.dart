import 'package:bloc/bloc.dart';
import 'package:wasili/cubit/delivery_cubits/inprogress_order/inprogress_order_state.dart';
import 'package:wasili/model/delivery_models/inprogress_order_model.dart';
import 'package:wasili/services/remote/delivery_services/inprogress_order_services.dart';

class InProgressOrderCubit extends Cubit<InProgressOrderStates> {
  InProgressOrderCubit() : super(InProgressOrderInitial());
  InProgressOrderModel? inProgressOrderModel;
  Future putOrderInProgressOrder(
      {required String token, required String orderId}) async {
    try {
      emit(PutOrderInProgressLoadingState());
      await InProgressOrderServices()
          .putOrderInProgress(
        orderId: orderId,
        token: token,
      )
          .then(
        (value) {
          emit(PutOrderInProgressSuccessState());
        },
      ).catchError((error) {
        print(error);

        emit(PutOrderInProgressFailedState());
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future getAllOrderInProgressOrder({required String token}) async {
    try {
      emit(InProgressOrderLoadingState());
      await InProgressOrderServices()
          .getAllOrderInProgress(
        token: token,
      )
          .then(
        (value) {
          inProgressOrderModel = InProgressOrderModel.fromJson(value);
          print("___________InProgress________");
          print(value.toString());
          print("___________InProgress________");
          emit(InProgressOrderSuccessState());
        },
      ).catchError((error) {
        print(error);
        emit(InProgressOrderFailedState());
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
