import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.text,
      required this.onPressed,
      this.width = double.infinity,
      this.isIcon,
      this.borderRadius = 12});
  String? text;
  final void Function()? onPressed;
  double width;
  double borderRadius;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      width: width,
      height: 50.0,
      child: isIcon == true
          ? IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.filter_list,
                size: 20,
                color: Colors.white,
              ),
            )
          : TextButton(
              onPressed: onPressed,
              child: Text(
                text!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
