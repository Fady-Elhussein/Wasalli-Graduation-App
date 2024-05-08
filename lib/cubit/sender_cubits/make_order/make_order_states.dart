import 'package:wasili/model/sender_models/make_order_model.dart';

abstract class MakeOrderStates {}

class MakeOrderInitialState extends MakeOrderStates {}

class MakeOrderLoadingState extends MakeOrderStates {}

class MakeOrderSuccessState extends MakeOrderStates {
  MakeOrderModel makeOrderModel;
  MakeOrderSuccessState({
    required this.makeOrderModel,
  });
}

class MakeOrderFailedState extends MakeOrderStates {}

class MakeOrderSeePsswordState extends MakeOrderStates {}
