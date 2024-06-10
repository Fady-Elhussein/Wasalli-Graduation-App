import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/history_order/cubit/history_order_cubit.dart';
import 'package:wasili/widgets/main_widgets/container.dart';

class HistoryDeliveryOrderDetailsView extends StatelessWidget {
  const HistoryDeliveryOrderDetailsView({
    super.key,
  });
  static String id = 'HistoryDeliveryOrderDetailsView';

  @override
  Widget build(BuildContext context) {
    var historyOrderCubitObject = BlocProvider.of<HistoryOrderCubit>(context);
    int index = ModalRoute.of(context)!.settings.arguments as int;

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
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 25,
            ),
            ContainerWidget(
              text:
                  'الشحنه :    ${historyOrderCubitObject.historyModel!.data![index].shipmentName!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'سعر الشحنه :   ${historyOrderCubitObject.historyModel!.data![index].shipmentPrice!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'سعر التوصيل : ${historyOrderCubitObject.historyModel!.data![index].deliveryCost!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'من :    ${historyOrderCubitObject.historyModel!.data![index].from!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'الي :     ${historyOrderCubitObject.historyModel!.data![index].to!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'هاتف المستلم :    ${historyOrderCubitObject.historyModel!.data![index].recipientPhoneNumber!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'المرسل :    ${historyOrderCubitObject.historyModel!.data![index].sender!.fName} ${historyOrderCubitObject.historyModel!.data![index].sender!.lName}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'رقم هاتف المرسل :    ${historyOrderCubitObject.historyModel!.data![index].sender!.phoneNumber!}',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'تاريخ الارسال :  ${DateFormat(' hh:mm a  -  dd/MM/yyyy').format(DateTime.parse(historyOrderCubitObject.historyModel!.data![index].createdAt!)).replaceAll('AM', 'ص').replaceAll('PM', 'م')} ',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'رقم اضافي للمرسل :  ${historyOrderCubitObject.historyModel!.data![index].alternateSenderPhoneNumber}  ',
            ),
            const SizedBox(
              height: 5,
            ),
            ContainerWidget(
              text:
                  'تعليق :  ${historyOrderCubitObject.historyModel!.data![index].comment}',
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
