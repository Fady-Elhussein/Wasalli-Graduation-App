import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/const/const.dart';

import 'package:wasili/cubit/update_profile/cubit/update_profile_cubit.dart';
import 'package:wasili/cubit/update_profile/cubit/update_profile_state.dart';
import 'package:wasili/model/profile_model.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/widgets/Delivery_widgets/cards_button.dart';
import 'package:wasili/widgets/main_widgets/container.dart';

import 'package:wasili/widgets/main_widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class ModifiedAccountView extends StatelessWidget {
  ModifiedAccountView({super.key});
  static String id = 'ModifiedAccountScreen';
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? fnameController = TextEditingController();
  TextEditingController? lNameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var profileCubitObject =
        ModalRoute.of(context)!.settings.arguments as ProfileModel;
    String? cacheToken =
        CacheHelper.getData(key: 'token') ?? profileCubitObject.token;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("حسابي"),
        titleTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontSize: 30,
        ),
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: const Icon(Icons.arrow_forward_ios),
              color: kPrimaryColor,
              iconSize: 25.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                CustomTextFormField(
                  contentPadding: 12,
                  keyboardType: TextInputType.name,
                  readOnly: false,
                  text: 'الاسم الاول: ${profileCubitObject.user!.fName} ',
                  controller: fnameController,
                  colorCards: kPrimaryColorCards,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  contentPadding: 12,
                  keyboardType: TextInputType.name,
                  readOnly: false,
                  text: 'الاسم الثاني : ${profileCubitObject.user!.lName}',
                  controller: lNameController,
                  colorCards: kPrimaryColorCards,
                ),
                const SizedBox(
                  height: 10,
                ),
                ContainerWidget(
                  text:
                      'الرقم القومي :    ${profileCubitObject.user!.nationalID}',
                ),
                const SizedBox(
                  height: 10,
                ),
                ContainerWidget(
                  text:
                      'البريد الالكتروني :    ${profileCubitObject.user!.email}',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  contentPadding: 12,
                  keyboardType: TextInputType.name,
                  readOnly: false,
                  text: 'رقم الهاتف: ${profileCubitObject.user!.phoneNumber}',
                  controller: phoneController,
                  colorCards: kPrimaryColorCards,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  contentPadding: 12,
                  keyboardType: TextInputType.name,
                  readOnly: false,
                  text: 'العنوان: ${profileCubitObject.user!.address}',
                  controller: addressController,
                  colorCards: kPrimaryColorCards,
                ),
                const SizedBox(
                  height: 10,
                ),
                ContainerWidget(
                  text: 'النوع :    ${profileCubitObject.user!.gender}',
                ),
                const SizedBox(
                  height: 50,
                ),
                state is UpdateProfileLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      )
                    : Center(
                        child: CardsButton(
                          text: 'حفظ التغيرات',
                          onPressed: () {
                            BlocProvider.of<UpdateProfileCubit>(context)
                                .updateProfile(
                              token: cacheToken!,
                              fName: fnameController?.text ??
                                  profileCubitObject.user!.fName!,
                              lName: lNameController?.text ??
                                  profileCubitObject.user!.lName!,
                              
                              phoneNumber: phoneController?.text ??
                                  profileCubitObject.user!.phoneNumber!,
                              address: addressController?.text ??
                                  profileCubitObject.user!.address!,
                            )
                                .then((value) {
                              Navigator.pop(context);
                            });
                          },
                          width: 150,
                          height: 45,
                          color: kPrimaryColor,
                          borderRadius: 20,
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
