import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/sender_cubits/delete_order/cubit/delete_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/watting_order/watting_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/watting_order/watting_order_state.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/widgets/Delivery_widgets/cards.dart';
import 'package:wasili/widgets/loading_animation_widget.dart';

class WaitingOrderView extends StatelessWidget {
  static String id = 'WaitingOrderView';

  const WaitingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;
    var wattingOrderCubitObject = BlocProvider.of<WattingOrderCubit>(context);
    wattingOrderCubitObject.getAllWattingOrder(token: cacheToken!);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(right: 10),
          icon: const Icon(Icons.arrow_back_ios),
          color: kPrimaryColor,
          iconSize: 25.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('طلبات قيد الانتظار'),
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 30,
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  wattingOrderCubitObject.getAllWattingOrder(token: cacheToken);
                },
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<WattingOrderCubit, WattingOrderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (wattingOrderCubitObject.waitingOrderModel == null &&
              state is WattingOrderLoadingState) {
            return const LoadingAnimationWidgett();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => CardsWidget(
                        title: wattingOrderCubitObject
                            .waitingOrderModel!.data![index].shipmentName!,
                        sender: wattingOrderCubitObject
                            .waitingOrderModel!.data![index].sender!.fName!,
                        orderCost: wattingOrderCubitObject
                            .waitingOrderModel!.data![index].shipmentPrice!,
                        deliveryCost: wattingOrderCubitObject
                            .waitingOrderModel!.data![index].deliveryCost!,
                        from: wattingOrderCubitObject
                            .waitingOrderModel!.data![index].from!,
                        to: wattingOrderCubitObject
                            .waitingOrderModel!.data![index].to!,
                        buttontext: 'الغاء الطلب',
                        isShownButton: true,
                        isCenterButton: true,
                        color: Colors.red,
                        onPressed: () {
                          BlocProvider.of<DeleteOrderCubit>(context)
                              .deletOrder(
                                  token: cacheToken,
                                  orderID: wattingOrderCubitObject
                                      .waitingOrderModel!.data![index].orderId!)
                              .then((value) {
                            wattingOrderCubitObject.getAllWattingOrder(
                                token: cacheToken);
                          });
                        },
                        onTap: () {},
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                  itemCount:
                      wattingOrderCubitObject.waitingOrderModel!.result!),
            );
          }
        },
      ),
    );
  }
}
