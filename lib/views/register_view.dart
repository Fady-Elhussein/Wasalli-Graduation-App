import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/register/register_cubit.dart';
import 'package:wasili/cubit/register/register_state.dart';
import 'package:wasili/helper/show_toast.dart';
import 'package:wasili/views/login_view.dart';
import 'package:wasili/widgets/main_widgets/custom_button.dart';
import 'package:wasili/widgets/main_widgets/custom_text_form_field.dart';
import 'package:wasili/widgets/main_widgets/drop_down_field.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  static String id = 'registerView';
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passwordConfirmcontroller = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nationalIDcontroller = TextEditingController();
  String? gender;
  String? role;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          kLogo,
          height: 140,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.status == 'success') {
              showToast(color: Colors.green, msg: state.registerModel.message);
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginView.id,
                (route) => false,
              );
            } else {
              showToast(color: Colors.red, msg: state.registerModel.message);
            }
          }
        },
        builder: (context, state) {
          var registerCubitObject = BlocProvider.of<RegisterCubit>(context);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'انشاء حساب',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              contentPadding: 25,
                              color: Colors.grey,
                              readOnly: false,
                              controller: fnameController,
                              keyboardType: TextInputType.name,
                              text: 'الاسم الاول',
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              contentPadding: 25,
                              color: Colors.grey,
                              readOnly: false,
                              controller: lNameController,
                              keyboardType: TextInputType.name,
                              text: 'الاسم الثاني',
                              prefixIcon: const Icon(Icons.people),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        color: Colors.grey,
                        readOnly: false,
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        text: 'البريد الالكتروني',
                        prefixIcon: const Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        color: Colors.grey,
                        readOnly: false,
                        controller: passwordcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        text: "كلمة المرور",
                        prefixIcon: const Icon(Icons.password),
                        obscureText: registerCubitObject.passwordvisable,
                        suffixIcon: IconButton(
                            onPressed: () {
                              registerCubitObject.seePassword();
                            },
                            icon: registerCubitObject.passwordvisable
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        color: Colors.grey,
                        readOnly: false,
                        prefixIcon: const Icon(Icons.password),
                        controller: passwordConfirmcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        text: "تأكيد كلمة المرور",
                        obscureText: registerCubitObject.passwordvisable,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        color: Colors.grey,
                        readOnly: false,
                        controller: nationalIDcontroller,
                        keyboardType: TextInputType.number,
                        text: 'الرقم القومي ',
                        maxLength: 14,
                        prefixIcon: const Icon(FontAwesomeIcons.idCard),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        color: Colors.grey,
                        readOnly: false,
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        text: 'رقم الهاتف',
                        prefixIcon: const Icon(Icons.phone),
                        maxLength: 11,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextFormField(
                        contentPadding: 25,
                        color: Colors.grey,
                        readOnly: false,
                        controller: addressController,
                        keyboardType: TextInputType.name,
                        text: 'العنوان',
                        prefixIcon:
                            const Icon(FontAwesomeIcons.locationCrosshairs),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DropDownField(
                              hint: 'المستخدم',
                              label1: 'دليفري',
                              label2: 'عميل',
                              onOptionSelected:
                                  (List<ValueItem> selectedOptions) {
                                for (var option in selectedOptions) {
                                  if (option.label == 'دليفري') {
                                    role = 'Delivery';
                                    return;
                                  } else {
                                    role = 'Sender';
                                    return;
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: DropDownField(
                                hint: 'الجنس',
                                label1: 'ذكر',
                                label2: 'أنثي',
                                onOptionSelected:
                                    (List<ValueItem> selectedOptions) {
                                  for (var option in selectedOptions) {
                                    if (option.label == 'ذكر') {
                                      gender = 'Male';
                                      return;
                                    } else {
                                      gender = 'Female';

                                      return;
                                    }
                                  }
                                }),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      if (state is RegisterLoadingState)
                        const CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      if (state is! RegisterLoadingState)
                        CustomButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              registerCubitObject.postData(
                                fName: fnameController.text,
                                lName: lNameController.text,
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                                phoneNumber: phoneController.text,
                                nationalId: nationalIDcontroller.text,
                                address: addressController.text,
                                passwordConfirm: passwordConfirmcontroller.text,
                                gender: gender!,
                                role: role!,
                              );
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                            }
                          },
                          text: 'انشاء حساب',
                        ),
                      const SizedBox(
                        height: 50.0,
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
