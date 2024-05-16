import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wasili/cubit/bloc_observer.dart';
import 'package:wasili/cubit/delivery_cubits/available_order/available_order_cubit.dart';
import 'package:wasili/cubit/delivery_cubits/delivered_order/delivered_order_cubit.dart';
import 'package:wasili/cubit/delivery_cubits/inprogress_order/inprogress_order_cubit.dart';
import 'package:wasili/cubit/delivery_cubits/delivery_navigation_bar/delivery_navigation_bar_cubit.dart';
import 'package:wasili/cubit/history_order/cubit/history_order_cubit.dart';
import 'package:wasili/cubit/login/login_cubit.dart';
import 'package:wasili/cubit/profile/cubit/profile_cubit.dart';
import 'package:wasili/cubit/register/register_cubit.dart';
import 'package:wasili/cubit/sender_cubits/delete_order/cubit/delete_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/inprogress_order/inprogress_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/make_order/make_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/sender_navigation_bar/sender_navigation_bar_cubit.dart';
import 'package:wasili/cubit/sender_cubits/watting_order/watting_order_cubit.dart';
import 'package:wasili/cubit/support/support_cubit.dart';
import 'package:wasili/cubit/update_profile/cubit/update_profile_cubit.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/delivery_views/available_order_view.dart';
import 'package:wasili/views/delivery_views/inprogress_order_view.dart';
import 'package:wasili/views/delivery_views/delivery_layout.dart';
import 'package:wasili/views/delivery_views/order_details_view.dart';
import 'package:wasili/views/history_orders_view.dart';
import 'package:wasili/views/profile_view.dart';
import 'package:wasili/views/sender_views/orders_view.dart';
import 'package:wasili/views/sender_views/sender_layout.dart';
import 'package:wasili/views/sender_views/inprogress_orders_view.dart';
import 'package:wasili/views/sender_views/sender_order_details.dart';
import 'package:wasili/views/sender_views/waiting_order_view.dart';
import 'package:wasili/views/support_view.dart';
import 'package:wasili/views/login_view.dart';
import 'package:wasili/views/modified_account_view.dart';
import 'package:wasili/views/on_boarding_view.dart';
import 'package:wasili/views/register_view.dart';
import 'package:wasili/views/sender_views/make_order_view.dart';
import 'package:wasili/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool boardingShown = CacheHelper.getData(key: 'boardingShown') ?? false;
  String token = CacheHelper.getData(key: 'token') ?? 'false';
  String role = CacheHelper.getData(key: 'role') ?? 'false';
  bool hasOrderInProgress =
      CacheHelper.getData(key: 'hasOrderInProgress') ?? false;
  print("Role : $role");
  print("token: $token");
  String startView;
  if (boardingShown == true) {
    if (token != 'false' && role == 'Sender') {
      startView = SenderLayoutView.id;
    } else if (token != 'false' && role == 'Delivery') {
      if (hasOrderInProgress == true) {
        startView = InProgressOrderView.id;
      } else {
        startView = DeliveryLayoutView.id;
      }
    } else {
      startView = LoginView.id;
    }
  } else {
    startView = OnBoardingView.id;
  }

  Bloc.observer = MyBlocObserver();
  runApp(Wasalli(
    startView: startView,
  ));
}

class Wasalli extends StatelessWidget {
  const Wasalli({super.key, required this.startView});
  final String startView;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => MakeOrderCubit(),
        ),
        BlocProvider(
          create: (context) => SenderNavigationBarCubit(),
        ),
        BlocProvider(
          create: (context) => DeliveryNavigationBarCubit(),
        ),
        BlocProvider(
          create: (context) => SupportCubit(),
        ),
        BlocProvider(
          create: (context) => AvailableOrderCubit(),
        ),
        BlocProvider(
          create: (context) => InProgressOrderCubit(),
        ),
        BlocProvider(
          create: (context) => WattingOrderCubit(),
        ),
        BlocProvider(
          create: (context) => InprogressOrderCubit(),
        ),
        BlocProvider(
          create: (context) => DeliveredOrderCubit(),
        ),
        BlocProvider(
          create: (context) => HistoryOrderCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteOrderCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateProfileCubit(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Wasalli - وصلّي',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        routes: {
          LoginView.id: (context) => LoginView(),
          RegisterView.id: (context) => RegisterView(),
          OnBoardingView.id: (context) => const OnBoardingView(),
          SplashView.id: (context) => const SplashView(),
          AvailableOrderView.id: (context) => const AvailableOrderView(),
          MakeOrderView.id: (context) => const MakeOrderView(),
          OrderDetailsView.id: (context) => const OrderDetailsView(),
          ModifiedAccountView.id: (context) => ModifiedAccountView(),
          SupportView.id: (context) => SupportView(),
          InProgressOrderView.id: (context) => const InProgressOrderView(),
          OrdersView.id: (context) => const OrdersView(),
          WaitingOrderView.id: (context) => const WaitingOrderView(),
          InProgressOrdersView.id: (context) => const InProgressOrdersView(),
          ProfileView.id: (context) => const ProfileView(),
          HistoryOrdersView.id: (context) => const HistoryOrdersView(),
          SenderLayoutView.id: (context) => const SenderLayoutView(),
          DeliveryLayoutView.id: (context) => const DeliveryLayoutView(),
          SenderOrderDetailsView.id: (context) =>
              const SenderOrderDetailsView(),
        },
        initialRoute: startView,
      ),
    );
  }
}
