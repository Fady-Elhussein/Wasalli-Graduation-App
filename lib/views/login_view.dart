import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/login/login_cubit.dart';
import 'package:wasili/cubit/login/login_state.dart';
import 'package:wasili/helper/show_toast.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/views/delivery_views/delivery_layout.dart';
import 'package:wasili/views/register_view.dart';
import 'package:wasili/views/sender_views/sender_layout.dart';
import 'package:wasili/widgets/main_widgets/custom_button.dart';
import 'package:wasili/widgets/main_widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  static String id = 'loginScreen';
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nationalIDcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          kLogo,
          height: 140,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSucessState) {
            if (state.loginModel.status == 'success') {
              showToast(color: Colors.green, msg: state.loginModel.message);
              CacheHelper.saveData(key: 'token', value: state.loginModel.token);
              if (state.loginModel.user!.role == 'Sender') {
                CacheHelper.saveData(key: 'role', value: 'Sender');
                Navigator.pushNamedAndRemoveUntil(
                  context, SenderLayoutView.id, (route) => false,
                    arguments: state.loginModel.token);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                 context, DeliveryLayoutView.id, (route) => false,
                    arguments: state.loginModel.token
                );
                CacheHelper.saveData(key: 'role', value: 'Delivery');
              }
            } else {
              showToast(color: Colors.red, msg: state.loginModel.message);
            }
          }
        },
        builder: (context, state) {
          var loginCubitObject = BlocProvider.of<LoginCubit>(context);

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40.0,
                      ),
                      const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        controller: nationalIDcontroller,
                        readOnly: false,
                        keyboardType: TextInputType.number,
                        text: 'الرقم القومي',
                        prefixIcon: const Icon(FontAwesomeIcons.idCard),
                        color: Colors.grey,
                        maxLength: 14,
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        color: Colors.grey,
                        readOnly: false,
                        controller: passwordcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        text: "كلمة المرور",
                        prefixIcon: const Icon(Icons.password),
                        obscureText: BlocProvider.of<LoginCubit>(context)
                            .passwordvisable,
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context).seePassword();
                          },
                          icon: loginCubitObject.passwordvisable
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      if (state is LoginLoadingState)
                        const CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      if (state is! LoginLoadingState)
                        CustomButton(
                          text: 'تسجيل الدخول',
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              loginCubitObject.postData(
                                  password: passwordcontroller.text,
                                  nationalID: nationalIDcontroller.text);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                            }
                          },
                        ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ليس لديك حساب ؟',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterView.id);
                            },
                            child: const Text(
                              'انشاء حساب',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
