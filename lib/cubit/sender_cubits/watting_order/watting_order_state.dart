
sealed class WattingOrderStates {}

final class WattingOrderInitialState extends WattingOrderStates {}
final class WattingOrderLoadingState extends WattingOrderStates {}
final class WattingOrderSuccessState extends WattingOrderStates {}
final class WattingOrderFailedState extends WattingOrderStates {}
