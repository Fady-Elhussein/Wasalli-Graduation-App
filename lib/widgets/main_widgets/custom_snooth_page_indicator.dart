import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/model/boarding_iteam_model.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/login_view.dart';
import 'package:wasili/widgets/main_widgets/boarding_iteam.dart';

class CustomSmoothPageIndicator extends StatefulWidget {
  const CustomSmoothPageIndicator({super.key});

  @override
  State<CustomSmoothPageIndicator> createState() =>
      _CustomSmoothPageIndicatorState();
}

class _CustomSmoothPageIndicatorState extends State<CustomSmoothPageIndicator> {
  PageController boardController = PageController();
  bool isLast = false;
  List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/images/1.jpg',
        title: 'أينما كنت نصل اليك ',
        body: 'وصلي - تطبيق التوصيل الذي يوفرلك سهولة التوصيل في أي وقت!'),
    BoardingModel(
        image: 'assets/images/2.jpg',
        title: 'توصيل طلبك كما تريد',
        body:
            'استمتع بتجربة توصيل فعّالة مع وصلي، حيث يمكنك إرسال طلباتك بسرعة ويسر وصلي يجمع بين السرعة والموثوقية'),
    BoardingModel(
      image: 'assets/images/3.jpg',
      title: 'هل تبحث عن وظيفة توصيل حرة؟',
      body:
          'انضم إلى وصلي واستمتع بالتواصل مع العملاء وكسب أموال إضافية في وقتك الخاص وحقق اهدافك المالية....',
    ),
  ];
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

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (index) {
              if (index == boardingList.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }
            },
            controller: boardController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) => BoardingIteams(
                  model: boardingList[index],
                )),
            itemCount: boardingList.length,
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boardingList.length,
                  effect: const WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: kSecanderyColor,
                  ),
                ),
                const Spacer(),
                isLast
                    ? TextButton(
                        onPressed: () {
                          skipOnBoarding();
                        },
                        child: const Text(
                          " أبدأ",
                          style: TextStyle(
                            color: kSecanderyColor,
                            fontSize: 24,
                          ),
                        ),
                      )
                    : FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          boardController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.decelerate,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_right_alt,
                          color: kPrimaryColor,
                        ),
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
