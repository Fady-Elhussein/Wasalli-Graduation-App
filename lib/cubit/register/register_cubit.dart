import 'package:bloc/bloc.dart';
import 'package:wasili/cubit/register/register_state.dart';
import 'package:wasili/model/register_model.dart';
import 'package:wasili/services/remote/register_services.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  bool passwordvisable = true;
  void seePassword() {
    passwordvisable = !passwordvisable;
    emit(RegisterSeePsswordState());
  }

  RegisterModel? registerModel;
  void postData({
    required String fName,
    required String lName,
    required String email,
    required String password,
    required String passwordConfirm,
    required String phoneNumber,
    required String nationalId,
    required String address,
    required String gender,
    required String role,
  }) {
    try {
      emit(RegisterLoadingState());
      RegisterServices()
          .postData(
        fName: fName,
        lName: lName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        nationalId: nationalId,
        address: address,
        gender: gender,
        role: role,
        passwordConfirm: passwordConfirm,
      )
          .then(
        (value) {
          registerModel = RegisterModel.fromJson(value);
          emit(RegisterSuccessState(registerModel: registerModel!));
          print(value.toString());
        },
      ).catchError((error) {
        print(error);
        emit(RegisterFailedState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
