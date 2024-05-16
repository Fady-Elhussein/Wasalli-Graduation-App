import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/sender_cubits/inprogress_order/inprogress_order_cubit.dart';
import 'package:wasili/widgets/main_widgets/container.dart';

class SenderOrderDetailsView extends StatelessWidget {
  const SenderOrderDetailsView({
    super.key,
  });
  static String id = 'SenderOrderDetailsView';


  @override
  Widget build(BuildContext context) {
    var inProgressOrderModel = BlocProvider.of<InprogressOrderCubit>(context).inProgressOrderModel;

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
              text: 'الشحنه :    ${inProgressOrderModel?.data![0].shipmentName }',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'سعر الشحنه :   ${inProgressOrderModel?.data![0].shipmentPrice }',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'سعر التوصيل : ${inProgressOrderModel?.data![0].deliveryCost }',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'موظف التوصيل :    ${inProgressOrderModel?.data![0].delivery!.fName }  ${inProgressOrderModel?.data![0].delivery!.lName }',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'رقم موظف التوصيل :      ${inProgressOrderModel?.data![0].delivery!.phoneNumber }',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'هاتف المستلم :     ${inProgressOrderModel?.data![0].recipientPhoneNumber }',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: ' عنوان المرسل :     ${inProgressOrderModel?.data![0].sender!.address }',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'رقم هاتف المرسل :     ${inProgressOrderModel?.data![0].sender!.phoneNumber }',
            ),
            const SizedBox(
              height: 5,
            ),
            // ContainerWidget(
            //   text: 'رقم اضافي للمرسل :    $anotherSenderPhone',
            // ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'عنوان المستلم :    ${inProgressOrderModel?.data![0].to }',
            ),
            const SizedBox(
              height: 5,
            ),
            // ContainerWidget(
            //   text: 'تعليق :    $comment',
            // ),
          ],
        ),
      ),
    );
  }
}
