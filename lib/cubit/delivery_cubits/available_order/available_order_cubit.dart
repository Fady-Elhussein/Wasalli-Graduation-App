import 'package:bloc/bloc.dart';
import 'package:wasili/cubit/delivery_cubits/available_order/available_order_state.dart';
import 'package:wasili/model/delivery_models/available_model.dart';
import 'package:wasili/services/remote/delivery_services/available_order_services.dart';

class AvailableOrderCubit extends Cubit<AvailableOrderStates> {
  AvailableOrderCubit() : super(AvailableOrderInitialState());
  AvailableOrderModel? availableOrderModel;
  Future getAllAvailableOrder({required String token}) async{
    try {
      emit(AvailableOrderLoadingState());
    await  AvailableOrderServices()
          .getAllAvailableOrder(
        token: token,
      )
          .then(
        (value) {
          availableOrderModel = AvailableOrderModel.fromJson(value);
          emit(AvailableOrderSuccessState());
          print(value.toString());
        },
      ).catchError((error) {
        print(error);
        emit(AvailableOrderFailedState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
