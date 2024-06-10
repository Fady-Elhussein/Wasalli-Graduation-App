import 'package:flutter/material.dart';
import 'package:wasili/const/const.dart';

AppBar appBar({required String title}) => AppBar(
      iconTheme: const IconThemeData(color: kPrimaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(title),
      titleTextStyle: const TextStyle(
        color: kPrimaryColor,
        fontSize: 30,
      ),
      centerTitle: true,
    );
