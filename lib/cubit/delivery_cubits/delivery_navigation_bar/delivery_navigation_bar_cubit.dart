import 'package:bloc/bloc.dart';
import 'package:wasili/views/delivery_views/available_order_view.dart';
import 'package:wasili/views/profile_view.dart';
import 'package:wasili/views/support_view.dart';

part 'delivery_navigation_bar_state.dart';

class DeliveryNavigationBarCubit extends Cubit<DeliveryNavigationBarState> {
  DeliveryNavigationBarCubit() : super(DeliveryNavigationBarInitial());

  final deliveryScreens = [
    const AvailableOrderView(),
    const ProfileView(),
    SupportView(),
  ];

  int currentIndex = 0;
  void changeNavBar(int index) {
    currentIndex = index;
    emit(DeliveryNavigationBarSuccess());
  }
}
