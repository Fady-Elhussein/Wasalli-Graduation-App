import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/support/support_state.dart';
import 'package:wasili/services/remote/support_services.dart';

class SupportCubit extends Cubit<SupportStates> {
  SupportCubit() : super(SupportInitialState());

  void postSupportMessage({
    required String name,
    required String email,
    required String phoneNumber,
    required String message,
    required String token,
  }) async {
    try {
      emit(SupportLoadingState());
      await SupportServices()
          .postSupportMessage(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        message: message,
        token: token,
      )
          .then(
        (value) {
          print(value);
          emit(SupporSuccesState());
        },
      ).catchError((error) {
        emit(SupportfailedState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
