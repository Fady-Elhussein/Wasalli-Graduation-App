import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/helper/show_toast.dart';
import 'package:wasili/widgets/Delivery_widgets/cards_button.dart';
import 'package:wasili/widgets/main_widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({super.key});
  TextEditingController alternateSenderPhoneNumbercontroller =
      TextEditingController();
  TextEditingController commentcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context)
            .viewInsets
            .bottom, //to make keyboard appear abave the form
        left: 16,
        right: 16,
        top: 40,
      ),
      
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.phone,
              readOnly: false,
              controller: alternateSenderPhoneNumbercontroller,
              text: 'اضافة رقم هاتف اخر',
              contentPadding: 15,
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.mobile_friendly)),
              color: kPrimaryColor,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              keyboardType: TextInputType.phone,
              readOnly: false,
              controller: commentcontroller,
              text: 'اضافة تعلق',
              contentPadding: 15,
              suffixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
              color: kPrimaryColor,
            ),
            const SizedBox(
              height: 30,
            ),
            CardsButton(
              text: 'تأكيد',
              onPressed: () {
                Navigator.pop(context, [
                  commentcontroller.text,
                  alternateSenderPhoneNumbercontroller.text
                ]);
                showToast(color: Colors.green, msg: 'نم ارسال تعليقك بنجاح');
              },
              height: 37,
              width: 100,
              color: kPrimaryColor,
              borderRadius: 20,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );

    // return Padding(
    //   padding: EdgeInsets.only(
    //     bottom: MediaQuery.of(context)
    //         .viewInsets
    //         .bottom, //to make keyboard appear abave the form
    //     left: 16,
    //     right: 16,
    //   ),
    //   child: SingleChildScrollView(
    //     child: Form(
    //       key: formkey,
    //       child: Column(
    //         children: [
    //           CustomTextFormField(
    //             keyboardType: TextInputType.phone,
    //             readOnly: false,
    //             controller: alternateSenderPhoneNumbercontroller,
    //             text: 'اضافة رقم هاتف اخر',
    //             contentPadding: 15,
    //             suffixIcon: IconButton(
    //                 onPressed: () {}, icon: const Icon(Icons.mobile_friendly)),
    //             color: kPrimaryColor,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           CustomTextFormField(
    //             keyboardType: TextInputType.phone,
    //             readOnly: false,
    //             controller: commentcontroller,
    //             text: 'اضافة تعلق',
    //             contentPadding: 15,
    //             suffixIcon: IconButton(
    //                 onPressed: () {}, icon: const Icon(Icons.comment)),
    //             color: kPrimaryColor,
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           CardsButton(
    //             text: 'تأكيد',
    //             onPressed: () {
    //               Navigator.pop(context, [
    //                 commentcontroller.text,
    //                 alternateSenderPhoneNumbercontroller.text
    //               ]);
    //               showToast(color: Colors.green, msg: 'نم ارسال تعليقك بنجاح');
    //             },
    //             height: 37,
    //             width: 100,
    //             color: kPrimaryColor,
    //             borderRadius: 20,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
