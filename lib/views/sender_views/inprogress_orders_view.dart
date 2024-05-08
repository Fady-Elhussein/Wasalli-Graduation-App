import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/sender_cubits/inprogress_order/inprogress_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/inprogress_order/inprogress_order_state.dart';
import 'package:wasili/widgets/Sender_widgets/sender_cards.dart';
import 'package:wasili/widgets/loading_animation_widget.dart';

class InProgressOrdersView extends StatelessWidget {
  const InProgressOrdersView({
    super.key,
    this.title,
    this.delivery,
    this.orderCost,
    this.receiver,
    this.receivingCost,
    this.from,
    this.to,
  });

  static String id = 'InProgressOrdersView';

  final String? title;
  final String? delivery;
  final int? orderCost;
  final String? receiver;
  final int? receivingCost;
  final String? from;
  final String? to;
  @override
  Widget build(BuildContext context) {
    final String token = ModalRoute.of(context)!.settings.arguments as String;

    var inprogressOrderCubitObject =
        BlocProvider.of<InprogressOrderCubit>(context);
    inprogressOrderCubitObject.getAllInProgressOrder(token: token);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                inprogressOrderCubitObject.getAllInProgressOrder(token: token);
              },
            );
          },
        ),
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('طلبات لم توصل بعد'),
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 30,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: const Icon(Icons.arrow_forward_ios),
            color: kPrimaryColor,
            iconSize: 25.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: BlocConsumer<InprogressOrderCubit, InprogressOrderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is InprogressOrderInitialState ||
              state is InprogressOrderLoadingState) {
            return const Center(
              child: LoadingAnimationWidgett(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 20,
                right: 20,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => SenderCardsWidget(
                        title: inprogressOrderCubitObject
                            .inProgressOrderModel!.data![index].shipmentName!,
                        delivery: inprogressOrderCubitObject
                            .inProgressOrderModel!
                            .data![index]
                            .delivery!
                            .fName!,
                        orderCost: inprogressOrderCubitObject
                            .inProgressOrderModel!.data![index].shipmentPrice!,
                        // receiver: inprogressOrderCubitObject.inProgressOrderModel!.data![index].,
                        receivingCost: inprogressOrderCubitObject
                            .inProgressOrderModel!.data![index].deliveryCost!,
                        from: inprogressOrderCubitObject
                            .inProgressOrderModel!.data![index].from!,
                        to: inprogressOrderCubitObject
                            .inProgressOrderModel!.data![index].to!,
                        onTap: () {},
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                      ),
                  itemCount: inprogressOrderCubitObject
                      .inProgressOrderModel!.data!.length),
            );
          }
        },
      ),
    );
  }
}
