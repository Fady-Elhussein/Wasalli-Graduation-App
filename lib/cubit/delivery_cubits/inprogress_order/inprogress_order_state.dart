
abstract class InProgressOrderStates {}

final class InProgressOrderInitial extends InProgressOrderStates{}
final class InProgressOrderLoadingState extends InProgressOrderStates{}
final class InProgressOrderSuccessState extends InProgressOrderStates{}
final class InProgressOrderFailedState extends InProgressOrderStates{}



final class PutOrderInProgressLoadingState extends InProgressOrderStates{}
final class PutOrderInProgressSuccessState extends InProgressOrderStates{}
final class PutOrderInProgressFailedState extends InProgressOrderStates{}
