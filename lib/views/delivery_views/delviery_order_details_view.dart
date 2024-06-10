import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/delivery_cubits/inprogress_order/inprogress_order_cubit.dart';
import 'package:wasili/widgets/main_widgets/container.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    super.key,
  });
  static String id = 'OrderDetailsView';

  @override
  Widget build(BuildContext context) {
    var inProgressOrderCubitObject =
        BlocProvider.of<InProgressOrderCubit>(context);

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            ContainerWidget(
              text:
                  'الشحنه :    ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].shipmentName!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'سعر الشحنه :   ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].shipmentPrice!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'سعر التوصيل : ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].deliveryCost!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'من :    ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].from!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'الي :     ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].to!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'هاتف المستلم :    ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].recipientPhoneNumber!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'المرسل :    ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].sender!.fName} ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].sender!.lName}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'رقم هاتف المرسل :    ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].sender!.phoneNumber!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'تاريخ الارسال :  ${DateFormat(' hh:mm a  -  dd/MM/yyyy').format(DateTime.parse(inProgressOrderCubitObject.inProgressOrderModel!.data![0].createdAt!)).replaceAll('AM', 'ص').replaceAll('PM', 'م')} ',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text: 'رقم اضافي للمرسل :    ',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'تعليق :    ${inProgressOrderCubitObject.inProgressOrderModel!.data![0].comment!}',
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
