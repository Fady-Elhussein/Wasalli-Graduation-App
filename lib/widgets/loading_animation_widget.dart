import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimationWidgett extends StatelessWidget {
  const LoadingAnimationWidgett({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            size: 40,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'جاري التحميل ....',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
