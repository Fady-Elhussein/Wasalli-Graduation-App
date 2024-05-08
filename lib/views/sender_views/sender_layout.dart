import 'package:flutter/material.dart';

import 'package:wasili/widgets/Sender_widgets/sender_navigation_bar.dart';

// ignore: must_be_immutable
class SenderLayoutView extends StatelessWidget {
  static String id = 'SenderLayoutView';

  const SenderLayoutView({super.key});

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
      body: SenderBottomBar(),
    );
  }
}
