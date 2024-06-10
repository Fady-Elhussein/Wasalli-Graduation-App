import 'package:bloc/bloc.dart';
import 'package:wasili/cubit/sender_cubits/make_order/make_order_states.dart';
import 'package:wasili/model/sender_models/make_order_model.dart';
import 'package:wasili/services/remote/sender_services/make_order_services.dart';

class MakeOrderCubit extends Cubit<MakeOrderStates> {
  MakeOrderCubit() : super(MakeOrderInitialState());
  MakeOrderModel? makeOrderModel;
  Future makeOrder({
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
      emit(MakeOrderLoadingState());
      await MakeOredrServices()
          .postOrder(
        shipmentName: shipmentName,
        from: from,
        to: to,
        shipmentPrice: shipmentPrice,
        recipientPhoneNumber: recipientPhoneNumber,
        deliveryCost: deliveryCost,
        token: token,
        alternateSenderPhoneNumber: alternateSenderPhoneNumber,
        comment: comment,
      )
          .then(
        (value) {
          print(value);
          makeOrderModel = MakeOrderModel.fromJson(value);
          emit(MakeOrderSuccessState(makeOrderModel: makeOrderModel!));
        },
      ).catchError((error) {
        emit(MakeOrderFailedState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
