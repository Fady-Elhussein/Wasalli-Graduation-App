import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/history_order/cubit/history_order_state.dart';
import 'package:wasili/model/history_model.dart';
import 'package:wasili/services/remote/get_history_services.dart';

class HistoryOrderCubit extends Cubit<HistoryOrderStates> {
  HistoryOrderCubit() : super(HistoryOrderInitialState());
  HistoryModel? historyModel;

  void getAllHistoryOreder({required String token}) {
    try {
      emit(HistoryOrderLoadingState());

      HistoryServices().getHistory(token: token).then(
        (value) {
          historyModel = HistoryModel.fromJson(value);
          print(value);

          emit(HistoryOrderSuccessState());
        },
      ).catchError((error) {
        print(error);
        emit(HistoryOrderFailedState());
        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
