import 'package:flutter/material.dart';
import 'package:wasili/widgets/Delivery_widgets/delivery_navigation_bar.dart';


class DeliveryLayoutView extends StatelessWidget {

  static String id = 'DeliveryLayoutView';

  const DeliveryLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/Logo.png',
          height: 140,
        ),
        centerTitle: true,
      ),
      
      body: DeliveryBottomBar(),
    );
  }
}