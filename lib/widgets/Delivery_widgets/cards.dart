import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/widgets/Delivery_widgets/cards_contents.dart';

// ignore: must_be_immutable
class CardsWidget extends StatelessWidget {
  CardsWidget({
    super.key,
    required this.title,
    required this.sender,
    required this.orderCost,
    required this.deliveryCost,
    required this.from,
    required this.to,
    this.buttontext,
    this.color,
    this.onTap,
    this.fontColor = Colors.white,
    this.isShownButton,
    this.isCenterButton,
    this.height,
    this.onPressed,
  });

  String title;
  String sender;

  String orderCost;
  String deliveryCost;
  String from;
  String to;
  String? buttontext;
  Color? color = kPrimaryColor;
  void Function()? onTap;
  Color? fontColor;
  bool? isShownButton = false;
  bool? isCenterButton = false;
  double? height = 275;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kPrimaryColorCards,
        borderRadius: BorderRadius.circular(20),
      ),
      height: height,
      child: GestureDetector(
        onTap: onTap,
        child: CardsContents(
          onPressed: onPressed,
          isShownButton: isShownButton,
          isCenterButton: isCenterButton,
          title: title,
          sender: sender,
          orderCost: orderCost,
          deliveryCost: deliveryCost,
          from: from,
          to: to,
          buttontext: buttontext,
          fontColor: fontColor,
          color: color,
        ),
      ),
    );
  }
}
