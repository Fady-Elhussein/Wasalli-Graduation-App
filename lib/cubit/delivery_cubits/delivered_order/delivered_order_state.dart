
abstract class DeliveredOrderStates {}

final class DeliveredOrderInitialState extends DeliveredOrderStates {}
final class DeliveredOrderLoadingState extends DeliveredOrderStates {}
final class DeliveredOrderSuccessState extends DeliveredOrderStates {}
final class DeliveredOrderFailedState extends DeliveredOrderStates {}
