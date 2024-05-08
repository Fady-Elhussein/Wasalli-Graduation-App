import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/widgets/main_widgets/container.dart';

// ignore: must_be_immutable
class SenderOrderDetailsView extends StatelessWidget {
  SenderOrderDetailsView({
    super.key,
  });
  static String id = 'SenderOrderDetailsView';
  String? order;
  int? orderCost;
  int? receivingCost;
  String? delivery;
  String? deliveryPhone;
  String? receiverPhone;
  String? senderAddress;
  String? senderPhone;
  String? anotherSenderPhone;
  String? receiverAddress;
  String? comment;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("تفاصيل الطلب"),
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 30,
        ),
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: const Icon(Icons.arrow_forward_ios),
              color: kPrimaryColor,
              iconSize: 25.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            ContainerWidget(
              text: 'الشحنه :    $order',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'سعر الشحنه :   $orderCost',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'سعر التوصيل : $receivingCost',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'موظف التوصيل :    $delivery',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'رقم موظف التوصيل :     $deliveryPhone',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'هاتف المستلم :    $receiverPhone',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: ' عنوان المرسل :    $senderAddress',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'رقم هاتف المرسل :    $senderPhone',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'رقم اضافي للمرسل :    $anotherSenderPhone',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'عنوان المستلم :    $receiverAddress',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'تعليق :    $comment',
            ),
          ],
        ),
      ),
    );
  }
}
