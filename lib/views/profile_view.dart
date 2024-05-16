import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/profile/cubit/profile_cubit.dart';
import 'package:wasili/cubit/profile/cubit/profile_state.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/history_orders_view.dart';
import 'package:wasili/views/login_view.dart';
import 'package:wasili/views/modified_account_view.dart';
import 'package:wasili/widgets/Delivery_widgets/cards_button.dart';
import 'package:wasili/widgets/app_bar_widget.dart';
import 'package:wasili/widgets/loading_animation_widget.dart';
import 'package:wasili/widgets/main_widgets/container.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String id = 'ProfileView';

  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;
    ProfileCubit profileCubitObject = BlocProvider.of<ProfileCubit>(context);
    profileCubitObject.getProfileData(token: cacheToken!);

    return Scaffold(
      appBar: appBar(title: 'حسابي'),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoadingState &&
              profileCubitObject.profileModel == null) {
            return const LoadingAnimationWidgett();
          } else {
            return Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ContainerWidget(
                    text:
                        'الاسم :    ${profileCubitObject.profileModel!.user!.fName}  ${profileCubitObject.profileModel!.user!.lName}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ContainerWidget(
                    text:
                        'الرقم القومي :     ${profileCubitObject.profileModel!.user!.nationalID}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ContainerWidget(
                    text:
                        'البريد الالكتروني :    ${profileCubitObject.profileModel!.user!.email}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ContainerWidget(
                    text:
                        'رقم الهاتف :    ${profileCubitObject.profileModel!.user!.phoneNumber}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ContainerWidget(
                    text:
                        'العنوان :   ${profileCubitObject.profileModel!.user!.address}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ContainerWidget(
                    text:
                        'النوع :    ${profileCubitObject.profileModel!.user!.gender}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CardsButton(
                    text: 'سجل التوصيلات',
                    onPressed: () {
                      Navigator.pushNamed(context, HistoryOrdersView.id,
                          arguments: cacheToken);
                    },
                    width: double.infinity,
                    height: 50,
                    color: kPrimaryColor,
                    borderRadius: 12,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CardsButton(
                          text: 'تسجيل خروج',
                          onPressed: () {
                            CacheHelper.removeData(key: 'token')?.then(
                              (value) => {
                                CacheHelper.removeData(key: 'role'),
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginView.id,
                                  (route) => false,
                                ),
                              },
                            );
                          },
                          width: 0,
                          height: 45,
                          color: const Color.fromARGB(255, 213, 16, 2),
                          borderRadius: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Expanded(
                        child: CardsButton(
                          text: 'تحديث بياناتي',
                          onPressed: () {
                            Navigator.pushNamed(context, ModifiedAccountView.id,
                                arguments: profileCubitObject.profileModel);
                          },
                          width: 0,
                          height: 45,
                          color: kPrimaryColor,
                          borderRadius: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
