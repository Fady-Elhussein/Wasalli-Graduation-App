import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/widgets/Sender_widgets/sender_cards_contents.dart';

// ignore: must_be_immutable
class SenderCardsWidget extends StatelessWidget {
  SenderCardsWidget({
    super.key,
    required this.title,
    required this.delivery,
    required this.orderCost,
    // required this.receiver,
    required this.receivingCost,
    required this.from,
    required this.to,
 

    required this.onTap,

    this.height,
  });

  String title;
  String delivery;
  String orderCost;
  // String receiver;
  String receivingCost;
  String from;
  String to;
  

  void Function() onTap;
 

  double? height = 275;

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
        child: SenderCardsContents(

          title: title,
          delivery: delivery,
          orderCost: orderCost,
          // receiver: receiver,
          receivingCost: receivingCost,
          from: from,
          to: to,
          
        ),
      ),
    );
  }
}
