import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';

import 'package:wasili/cubit/sender_cubits/sender_navigation_bar/sender_navigation_bar_cubit.dart';
import 'package:wasili/cubit/sender_cubits/sender_navigation_bar/sender_navigation_bar_state.dart';

class SenderBottomBar extends StatelessWidget {
  SenderBottomBar({super.key});

  final navigationKey = GlobalKey<CurvedNavigationBarState>();
 
 
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 25),
      const Icon(Icons.local_shipping, size: 25),
      const Icon(Icons.person, size: 25),
      const Icon(Icons.help, size: 25),
    ];

    return BlocConsumer<SenderNavigationBarCubit, SenderNavigationBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 25,
                ),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                backgroundColor: Colors.transparent,
                color: kPrimaryColor,
                animationDuration: const Duration(milliseconds: 640),
                height: 50,
                index: BlocProvider.of<SenderNavigationBarCubit>(context)
                    .currentIndex,
                items: items,
                onTap: (newIndex) {
                  BlocProvider.of<SenderNavigationBarCubit>(context)
                      .changeNavBar(newIndex);
                },
              )),
          body: BlocProvider.of<SenderNavigationBarCubit>(context)
                  .senderScreens[
              BlocProvider.of<SenderNavigationBarCubit>(context).currentIndex],
        );
      },
    );
  }
}
