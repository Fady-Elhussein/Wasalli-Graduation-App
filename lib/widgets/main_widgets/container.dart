import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';

// ignore: must_be_immutable
class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: kPrimaryColorCards,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15,
          top: 15,
          bottom: 18,
        ),
        child: Text(
          text,
          style: const TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
