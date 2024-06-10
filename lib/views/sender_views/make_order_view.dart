import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wasili/const/const.dart';
import 'package:wasili/cubit/sender_cubits/make_order/make_order_cubit.dart';
import 'package:wasili/cubit/sender_cubits/make_order/make_order_states.dart';
import 'package:wasili/helper/show_toast.dart';
import 'package:wasili/services/local/cache_helper.dart';
import 'package:wasili/widgets/Delivery_widgets/cards_button.dart';
import 'package:wasili/widgets/app_bar_widget.dart';
import 'package:wasili/widgets/main_widgets/custom_button.dart';
import 'package:wasili/widgets/main_widgets/custom_text_form_field.dart';

class MakeOrderView extends StatelessWidget {
  const MakeOrderView({
    super.key,
  });
  static String id = 'MakeOrderView';

  @override
  Widget build(BuildContext context) {
    String? cacheToken = CacheHelper.getData(key: 'token') ??
        ModalRoute.of(context)!.settings.arguments as String;

    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController shipmentNamecontroller = TextEditingController();
    TextEditingController fromcontroller = TextEditingController();
    TextEditingController toController = TextEditingController();
    TextEditingController shipmentPriceController = TextEditingController();
    TextEditingController deliveryCostController = TextEditingController();

    TextEditingController recipientPhoneNumberController =
        TextEditingController();
    TextEditingController alternateSenderPhoneNumbercontroller =
        TextEditingController();
    TextEditingController commentcontroller = TextEditingController();

    return Scaffold(
      appBar: appBar(title: 'انشاء طلب'),
      body: BlocConsumer<MakeOrderCubit, MakeOrderStates>(
        listener: (context, state) {
          if (state is MakeOrderSuccessState) {
            if (state.makeOrderModel.status == 'success') {
              showToast(
                  color: Colors.green, msg: state.makeOrderModel.message!);
            } else {
              showToast(color: Colors.red, msg: state.makeOrderModel.message!);
            }
          }
        },
        builder: (context, state) {
          var makeOrderCubitObject = BlocProvider.of<MakeOrderCubit>(context);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.name,
                    controller: shipmentNamecontroller,
                    readOnly: false,
                    text: 'الشحنه',
                    contentPadding: 15,
                    colorCards: kPrimaryColorCards,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.streetAddress,
                    readOnly: false,
                    controller: fromcontroller,
                    text: 'من',
                    contentPadding: 15,
                    colorCards: kPrimaryColorCards,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shop_two),
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.streetAddress,
                    readOnly: false,
                    controller: toController,
                    text: 'الي',
                    contentPadding: 15,
                    colorCards: kPrimaryColorCards,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.home),
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.number,
                    readOnly: false,
                    controller: shipmentPriceController,
                    text: 'سعر الشحنه',
                    contentPadding: 15,
                    colorCards: kPrimaryColorCards,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.money),
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.number,
                    readOnly: false,
                    text: 'تكلفة التوصيل',
                    controller: deliveryCostController,
                    contentPadding: 15,
                    colorCards: kPrimaryColorCards,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.money),
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    keyboardType: TextInputType.phone,
                    readOnly: false,
                    text: 'رقم هاتف المستلم',
                    controller: recipientPhoneNumberController,
                    maxLength: 11,
                    contentPadding: 15,
                    colorCards: kPrimaryColorCards,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        child: CustomButton(
                          isIcon: true,
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom, // to make keyboard appear above the form
                                    left: 16,
                                    right: 16,
                                    top: 40,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        CustomTextFormField(
                                          keyboardType: TextInputType.phone,
                                          readOnly: false,
                                          controller:
                                              alternateSenderPhoneNumbercontroller,
                                          text: 'اضافة رقم هاتف اخر',
                                          contentPadding: 15,
                                          suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.mobile_friendly),
                                          ),
                                          color: kPrimaryColor,
                                        ),
                                        const SizedBox(height: 20),
                                        CustomTextFormField(
                                          keyboardType: TextInputType.text,
                                          readOnly: false,
                                          controller: commentcontroller,
                                          text: 'اضافة تعليق',
                                          contentPadding: 15,
                                          suffixIcon: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.comment)),
                                          color: kPrimaryColor,
                                        ),
                                        const SizedBox(height: 30),
                                        CardsButton(
                                          text: 'تأكيد',
                                          onPressed: () {
                                            showToast(
                                                color: Colors.green,
                                                msg: 'تم اضافة تعليقك بنجاح');
                                            Navigator.pop(context);
                                          },
                                          height: 37,
                                          width: 100,
                                          color: kPrimaryColor,
                                          borderRadius: 20,
                                        ),
                                        const SizedBox(height: 30),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          width: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      if (state is MakeOrderLoadingState)
                        const SizedBox(
                          width: 250,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      if (state is! MakeOrderLoadingState)
                        SizedBox(
                          child: CustomButton(
                            text: 'انشاء الطلب',
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                makeOrderCubitObject
                                    .makeOrder(
                                  shipmentName: shipmentNamecontroller.text,
                                  from: fromcontroller.text,
                                  to: toController.text,
                                  shipmentPrice: shipmentPriceController.text,
                                  deliveryCost: deliveryCostController.text,
                                  recipientPhoneNumber:
                                      recipientPhoneNumberController.text,
                                  token: cacheToken!,
                                  alternateSenderPhoneNumber:
                                      alternateSenderPhoneNumbercontroller.text,
                                  comment: commentcontroller.text,
                                )
                                    .then(
                                  (value) {
                                    if (makeOrderCubitObject
                                            .makeOrderModel!.status ==
                                        'success') {
                                      shipmentNamecontroller.clear();
                                      fromcontroller.clear();
                                      toController.clear();
                                      shipmentPriceController.clear();
                                      deliveryCostController.clear();
                                      recipientPhoneNumberController.clear();
                                    }
                                  },
                                );
                              }
                            },
                            width: 280,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
