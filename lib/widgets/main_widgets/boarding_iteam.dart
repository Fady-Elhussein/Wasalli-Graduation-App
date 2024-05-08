import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';
import 'package:wasili/model/boarding_iteam_model.dart';

class BoardingIteams extends StatelessWidget {
  const BoardingIteams({super.key, required this.model});
  final BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Image(
              image: AssetImage(
                model.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                model.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: kSecanderyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                model.body,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: kSecanderyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
