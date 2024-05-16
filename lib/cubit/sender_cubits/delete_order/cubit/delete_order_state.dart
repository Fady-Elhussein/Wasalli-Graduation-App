
 abstract class DeleteOrderStates {}

final class DeleteOrderInitialState extends DeleteOrderStates {}
final class DeleteOrderLoadingState extends DeleteOrderStates {}
final class DeleteOrderSuccessState extends DeleteOrderStates {}
final class DeleteOrderFailedState extends DeleteOrderStates {}
