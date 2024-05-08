import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/sender_views/inprogress_orders_view.dart';
import 'package:wasili/views/sender_views/waiting_order_view.dart';
import 'package:wasili/widgets/Delivery_widgets/cards_button.dart';
import 'package:wasili/widgets/app_bar_widget.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static String id = 'OrdersView';
  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: appBar(title: 'الطلبات'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardsButton(
              text: 'طلبات قيد الانتظار',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  WaitingOrderView.id,
                  arguments: cacheToken,
                );
              },
              height: 70,
              width: double.infinity,
              color: kPrimaryColor,
              borderRadius: 10,
              fontsize: 25,
            ),
            const SizedBox(
              height: 70,
            ),
            CardsButton(
              text: 'طلبات لم توصل بعد',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  InProgressOrdersView.id,
                  arguments: cacheToken,
                );
              },
              height: 70,
              width: double.infinity,
              color: kPrimaryColor,
              borderRadius: 10,
              fontsize: 25,
            ),
          ],
        ),
      ),
    );
  }
}
