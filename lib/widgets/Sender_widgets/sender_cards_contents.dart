import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';


// ignore: must_be_immutable
class SenderCardsContents extends StatelessWidget {
  SenderCardsContents({
    super.key,
    required this.title,
    required this.delivery,
    required this.orderCost,
    // required this.receiver,
    required this.receivingCost,
    required this.from,
    required this.to,
  });

  String title;
  String delivery;
  String orderCost;
  // String receiver;
  String receivingCost;
  String from;
  String to;

  @override
  Widget build(BuildContext context) {
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
                  'الموظف : $delivery',
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
              // Expanded(
              //   child: Text(
              //     'المستلم : $receiver',
              //     style: const TextStyle(
              //       color: kPrimaryColor,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  'سعر التوصيل : $receivingCost',
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
          const Text(
            'في الطريق للمستلم',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
