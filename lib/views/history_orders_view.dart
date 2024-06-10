import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/history_order/cubit/history_order_cubit.dart';
import 'package:wasili/cubit/history_order/cubit/history_order_state.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/delivery_views/history_delivery_orders_details_view.dart';
import 'package:wasili/views/sender_views/history_sender_order_detils_view.dart';
import 'package:wasili/widgets/Delivery_widgets/cards.dart';
import 'package:wasili/widgets/loading_animation_widget.dart';

class HistoryOrdersView extends StatelessWidget {
  const HistoryOrdersView({
    super.key,
  });

  static String id = 'HistoryOrdersView';

  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;
    var historyOrderCubitObject = BlocProvider.of<HistoryOrderCubit>(context);
    historyOrderCubitObject.getAllHistoryOreder(token: cacheToken!);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("سجل التوصيلات"),
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 30,
        ),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.only(right: 10),
          icon: const Icon(Icons.arrow_back_ios),
          color: kPrimaryColor,
          iconSize: 25.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<HistoryOrderCubit, HistoryOrderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HistoryOrderLoadingState &&
              historyOrderCubitObject.historyModel == null) {
            return const Center(
              child: LoadingAnimationWidgett(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CardsWidget(
                      title: historyOrderCubitObject
                          .historyModel!.data![index].shipmentName!,
                      sender: historyOrderCubitObject
                          .historyModel!.data![index].sender!.fName!,
                      orderCost: historyOrderCubitObject
                          .historyModel!.data![index].shipmentPrice!,
                      deliveryCost: historyOrderCubitObject
                          .historyModel!.data![index].deliveryCost!,
                      from: historyOrderCubitObject
                          .historyModel!.data![index].from!,
                      to: historyOrderCubitObject
                          .historyModel!.data![index].to!,
                      onTap: () {
                        String role = CacheHelper.getData(key: 'role');
                        if (role == 'Sender') {
                          Navigator.pushNamed(
                              context, HistorySenderOrderDetailsView.id,
                              arguments: index);
                        } else {
                          Navigator.pushNamed(
                              context, HistoryDeliveryOrderDetailsView.id,
                              arguments: index);
                        }
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                  itemCount:
                      historyOrderCubitObject.historyModel!.data!.length),
            );
          }
        },
      ),
    );
  }
}
