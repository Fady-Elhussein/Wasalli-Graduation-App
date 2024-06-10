import 'package:bloc/bloc.dart';
import 'package:wasili/cubit/login/login_state.dart';
import 'package:wasili/model/login_model.dart';
import 'package:wasili/services/remote/login_services.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  LoginModel? loginModel;
  void postData({required password, required nationalID}) async {
    try {
      emit(LoginLoadingState());
      await LoginServices()
          .postData(
        nationalID: nationalID,
        password: password,
      )
          .then(
        (value) {
          print(value);
          loginModel = LoginModel.fromjson(value);
          emit(LoginSucessState(loginModel: loginModel!));
        },
      ).catchError((error) {
        print(error);

        emit(LoginFailState());

        throw (error);
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  bool passwordvisable = true;
  void seePassword() {
    passwordvisable = !passwordvisable;
    emit(LoginSeePsswordState());
  }

  // getProfileData({required String token}) async {
  //   try {
  //     await ProfileServices().getProfileData(token: token).then(
  //       (value) {
  //         emit(ProfileSuccesState());
  //       },
  //     ).catchError(
  //       (error) {
  //         emit(ProfileFaildState());

  //         throw (error);
  //       },
  //     );
  //   } on Exception catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
