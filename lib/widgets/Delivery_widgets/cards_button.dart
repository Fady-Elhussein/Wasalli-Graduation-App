import 'package:flutter/material.dart';

class CardsButton extends StatelessWidget {
  const CardsButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    required this.height,
     this.color,
    required this.borderRadius,
    this.fontsize=16,
    this.fontColor=Colors.white,
  });
  final String? text;
  final void Function()? onPressed;
  final double? width;
  final double height;
  final Color? color;
  final double borderRadius;
  final double? fontsize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius), color: color),
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
            color: fontColor,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
