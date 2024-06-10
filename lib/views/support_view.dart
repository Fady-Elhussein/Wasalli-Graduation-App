import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasili/cubit/support/support_cubit.dart';
import 'package:wasili/cubit/support/support_state.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/widgets/app_bar_widget.dart';
import 'package:wasili/widgets/main_widgets/custom_button.dart';
import 'package:wasili/widgets/main_widgets/custom_text_form_field.dart';

class SupportView extends StatelessWidget {
  SupportView({super.key});
  static String id = 'SupportView';
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phoneNumbercontroller = TextEditingController();
  final TextEditingController messagelcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: appBar(title: 'الشكاوي و المقترحات'),
      body: BlocConsumer<SupportCubit, SupportStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var supportCubitObject = BlocProvider.of<SupportCubit>(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'الاسم * ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      readOnly: false,
                      text: 'ادخل اسمك هنا ',
                      color: Colors.grey,
                      contentPadding: 10,
                      controller: namecontroller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'البريد الالكتروني *',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      readOnly: false,
                      text: 'example@gmail.com',
                      color: Colors.grey,
                      contentPadding: 10,
                      controller: emailcontroller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'الهاتف *',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      readOnly: false,
                      text: '01025667061',
                      color: Colors.grey,
                      contentPadding: 10,
                      controller: phoneNumbercontroller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'الرسالة *',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      readOnly: false,
                      text: 'ادخل الشكوي هنا',
                      color: Colors.grey,
                      contentPadding: 10,
                      maxLines: 4,
                      controller: messagelcontroller,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      text: 'ارسال',
                      onPressed: () {
                        supportCubitObject.postSupportMessage(
                            name: namecontroller.text,
                            email: emailcontroller.text,
                            phoneNumber: phoneNumbercontroller.text,
                            message: messagelcontroller.text,
                            token: cacheToken!);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
