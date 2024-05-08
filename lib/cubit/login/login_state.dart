
import 'package:wasili/model/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSeePsswordState extends LoginStates {}

class LoginSucessState extends LoginStates {
  LoginModel loginModel;
  LoginSucessState({
    required this.loginModel,
  });
}

class LoginFailState extends LoginStates {}

