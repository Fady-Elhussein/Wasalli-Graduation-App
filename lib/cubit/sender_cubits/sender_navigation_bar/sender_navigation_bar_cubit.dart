import 'package:bloc/bloc.dart';
import 'package:wasili/cubit/sender_cubits/sender_navigation_bar/sender_navigation_bar_state.dart';
import 'package:wasili/views/profile_view.dart';
import 'package:wasili/views/sender_views/make_order_view.dart';
import 'package:wasili/views/sender_views/orders_view.dart';
import 'package:wasili/views/support_view.dart';

class SenderNavigationBarCubit extends Cubit<SenderNavigationBarState> {
  SenderNavigationBarCubit() : super(SenderNavigationBarInitial());

  final senderScreens = [
    const MakeOrderView(),
    const OrdersView(),
    const ProfileView(),
     SupportView(),
  ];

  int currentIndex = 0;
  void changeNavBar(int index) {
    currentIndex = index;
    emit(SenderNavigationBarSuccess());
  }
}
