import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/delivery_cubits/inprogress_order/inprogress_order_state.dart';
import 'package:wasili/cubit/sender_cubits/delete_order/cubit/delete_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/delete_order/cubit/delete_order_state.dart';
import 'package:wasili/widgets/Delivery_widgets/cards_button.dart';

// ignore: must_be_immutable
class CardsContents extends StatelessWidget {
  CardsContents(
      {super.key,
      required this.title,
      required this.sender,
      required this.orderCost,
      required this.deliveryCost,
      required this.from,
      required this.to,
      this.buttontext,
      this.color,
      this.onPressed,
      this.fontColor = Colors.white,
      this.isShownButton,
      this.isCenterButton});

  String title;
  void Function()? onPressed;
  String sender;
  String orderCost;
  String deliveryCost;
  String from;
  String to;
  String? buttontext;
  Color? color;
  Color? fontColor;
  bool? isShownButton = false;
  bool? isCenterButton = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteOrderCubit, DeleteOrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'المرسل : $sender',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      'سعر الشحنه : $orderCost',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'سعر التوصيل : $deliveryCost',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'من : $from',
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
              Text(
                'الي : $to',
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (isShownButton == true)
                isCenterButton == true
                    ? state is DeleteOrderLoadingState || state is PutOrderInProgressLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          )
                        : Center(
                            child: CardsButton(
                            text: buttontext,
                            fontColor: fontColor,
                            onPressed: onPressed,
                            width: 100.0,
                            height: 50.0,
                            color: color,
                            borderRadius: 35,
                          ))
                    : CardsButton(
                        text: buttontext,
                        fontColor: fontColor,
                        onPressed: onPressed,
                        width: 100.0,
                        height: 50.0,
                        color: color,
                        borderRadius: 35,
                      ),
            ],
          ),
        );
      },
    );
  }
}
