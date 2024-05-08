
abstract class HistoryOrderStates {}

final class HistoryOrderInitialState extends HistoryOrderStates {}
final class HistoryOrderLoadingState extends HistoryOrderStates {}
final class HistoryOrderSuccessState extends HistoryOrderStates {}
final class HistoryOrderFailedState extends HistoryOrderStates {}
