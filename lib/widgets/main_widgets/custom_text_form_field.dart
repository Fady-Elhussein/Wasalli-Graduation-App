import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.keyboardType,
    required this.readOnly,
    this.onFieldSubmitted,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.color,
    required this.contentPadding,
    this.maxLength,
    this.maxLines = 1,
    this.colorCards,
  });
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String?)? onFieldSubmitted;
  final String text;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final Color? color;
  final Color? colorCards;

  final double contentPadding;
  final int? maxLength;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (data) {
        if (data?.isEmpty ?? true) {
          return 'ادخل القيم ';
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        counter: const Offstage(),
        filled: true,
        fillColor: colorCards,
        focusColor: colorCards,
        labelText: text,
        labelStyle: const TextStyle(color: kPrimaryColor),
        contentPadding: EdgeInsets.all(contentPadding),
        prefixIcon: prefixIcon,
        prefixIconColor: color,
        suffixIconColor: color,
        suffixIcon: suffixIcon,
        border: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
      maxLength: maxLength,
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      8,
    ),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}
