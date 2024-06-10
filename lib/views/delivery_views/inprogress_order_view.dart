import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/delivery_cubits/available_order/available_order_cubit.dart';
import 'package:wasili/cubit/delivery_cubits/delivered_order/delivered_order_cubit.dart';
import 'package:wasili/cubit/delivery_cubits/inprogress_order/inprogress_order_cubit.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/delivery_views/delivery_layout.dart';
import 'package:wasili/views/delivery_views/delviery_order_details_view.dart';
import 'package:wasili/widgets/Delivery_widgets/cards.dart';
import 'package:wasili/widgets/loading_animation_widget.dart';

class InProgressOrderView extends StatelessWidget {
  const InProgressOrderView({super.key});
  static String id = 'InProgressOrderView';

  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;
    var inProgressOrderCubitObject =
        BlocProvider.of<InProgressOrderCubit>(context);
    var availableOrderCubitObject =
        BlocProvider.of<AvailableOrderCubit>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('الطلب الحالي'),
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 30,
        ),
      ),
      body: FutureBuilder<void>(
          future: loadData(context: context, cacheToken: cacheToken!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.hasError) {
              return const Center(
                child: LoadingAnimationWidgett(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 20,
                  right: 20,
                  bottom: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: inProgressOrderCubitObject
                            .inProgressOrderModel!.result,
                        itemBuilder: (context, index) => CardsWidget(
                          title: inProgressOrderCubitObject
                              .inProgressOrderModel!.data![index].shipmentName!,
                          sender: inProgressOrderCubitObject
                              .inProgressOrderModel!
                              .data![index]
                              .sender!
                              .fName!,
                          orderCost: inProgressOrderCubitObject
                              .inProgressOrderModel!
                              .data![index]
                              .shipmentPrice!,
                          deliveryCost: inProgressOrderCubitObject
                              .inProgressOrderModel!.data![index].deliveryCost!,
                          from: inProgressOrderCubitObject
                              .inProgressOrderModel!.data![index].from!,
                          to: inProgressOrderCubitObject
                              .inProgressOrderModel!.data![index].to!,
                          buttontext: 'تم التوصيل',
                          isShownButton: true,
                          isCenterButton: true,
                          color: kPrimaryColor,
                          onPressed: () {
                            BlocProvider.of<DeliveredOrderCubit>(context)
                                .putOrderInDelivered(
                                    token: cacheToken,
                                    orderId: inProgressOrderCubitObject
                                        .inProgressOrderModel!
                                        .data![index]
                                        .orderId!);
                            CacheHelper.removeData(key: 'hasOrderInProgress');
                            Navigator.pushReplacementNamed(
                                context, DeliveryLayoutView.id,
                                arguments: cacheToken);
                          },
                          onTap: () {
                            Navigator.pushNamed(context, OrderDetailsView.id);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 2,
                      color: kPrimaryColor,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'الطلبات المتاحة',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
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
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                        ),
                        itemCount: availableOrderCubitObject
                            .availableOrderModel!.data!.length,
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Future<void> loadData(
      {required BuildContext context, required String cacheToken}) async {
    var inProgressOrderCubitObject =
        BlocProvider.of<InProgressOrderCubit>(context);
    await BlocProvider.of<AvailableOrderCubit>(context)
        .getAllAvailableOrder(token: cacheToken);
    await inProgressOrderCubitObject.getAllOrderInProgressOrder(
        token: cacheToken);
  }
}
