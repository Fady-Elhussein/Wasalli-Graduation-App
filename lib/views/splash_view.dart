import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wasili/views/on_boarding_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String id = 'splashview';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/Logo.png'),
      nextScreen: const OnBoardingView(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}

