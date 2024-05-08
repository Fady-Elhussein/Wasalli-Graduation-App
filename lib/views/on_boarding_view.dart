import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/login_view.dart';
import 'package:wasili/widgets/main_widgets/custom_snooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = 'onBoardinView';

  @override
  Widget build(BuildContext context) {
    void skipOnBoarding() {
      CacheHelper.saveData(key: 'boardingShown', value: true).then((value) {
        if (value == true) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.id,
            (route) => false,
          );
        }
      });
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text(
                    'هل تريد التخطي ؟',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          skipOnBoarding();
                        },
                        child: const Text(
                          'نعم',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                          ),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'لا',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              "تخطي",
              style: TextStyle(color: kSecanderyColor),
            ),
          ),
        ],
      ),
      body: const CustomSmoothPageIndicator(),
    );
  }
}
