import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/delivery_cubits/available_order/available_order_cubit.dart';
import 'package:wasili/cubit/delivery_cubits/available_order/available_order_state.dart';
import 'package:wasili/cubit/delivery_cubits/inprogress_order/inprogress_order_cubit.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/delivery_views/inprogress_order_view.dart';
import 'package:wasili/widgets/Delivery_widgets/cards.dart';
import 'package:wasili/widgets/loading_animation_widget.dart';

class AvailableOrderView extends StatelessWidget {
  static String id = 'Availabe-OrderView';

  const AvailableOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;

    BlocProvider.of<AvailableOrderCubit>(context)
        .getAllAvailableOrder(token: cacheToken!);
    return BlocConsumer<AvailableOrderCubit, AvailableOrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var availableOrderCubitObject =
            BlocProvider.of<AvailableOrderCubit>(context);

        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: kPrimaryColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text("الطلبات المتاحة"),
            titleTextStyle: const TextStyle(
              color: kPrimaryColor,
              fontSize: 30,
            ),
            centerTitle: true,
            leading: IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: const Icon(Icons.refresh),
              color: kPrimaryColor,
              iconSize: 25.0,
              onPressed: () {
                availableOrderCubitObject.getAllAvailableOrder(
                    token: cacheToken);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: state is AvailableOrderLoadingState
                ? const LoadingAnimationWidgett()
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CardsWidget(
                      title: availableOrderCubitObject
                          .availableOrderModel!.data![index].shipmentName!,
                      sender: availableOrderCubitObject
                          .availableOrderModel!.data![index].sender!.fName!,
                      orderCost: availableOrderCubitObject
                          .availableOrderModel!.data![index].shipmentPrice!,
                      deliveryCost: availableOrderCubitObject
                          .availableOrderModel!.data![index].deliveryCost!,
                      from: availableOrderCubitObject
                          .availableOrderModel!.data![index].from!,
                      to: availableOrderCubitObject
                          .availableOrderModel!.data![index].to!,
                      buttontext: 'قبول',
                      isShownButton: true,
                      isCenterButton: true,
                      color: kPrimaryColor,
                      onPressed: () {
                        BlocProvider.of<InProgressOrderCubit>(context)
                            .putOrderInProgressOrder(
                                token: cacheToken,
                                orderId: availableOrderCubitObject
                                    .availableOrderModel!.data![index].orderId!)
                            .then((value) {
                          BlocProvider.of<InProgressOrderCubit>(context)
                              .getAllOrderInProgressOrder(token: cacheToken)
                              .then((value) {
                            CacheHelper.saveData(
                                key: 'hasOrderInProgress', value: true);
                            Navigator.pushReplacementNamed(
                                context, InProgressOrderView.id,
                                arguments: cacheToken);
                          });
                        });
                      },
                      onTap: () {},
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemCount: availableOrderCubitObject
                        .availableOrderModel!.data!.length,
                  ),
          ),
        );
      },
    );
  }
}
