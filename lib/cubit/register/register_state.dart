import 'package:wasili/model/register_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterModel registerModel;
  RegisterSuccessState({
    required this.registerModel,
  });
}

class RegisterFailedState extends RegisterStates {}

class RegisterSeePsswordState extends RegisterStates {}
