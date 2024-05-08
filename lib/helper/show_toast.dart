import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required Color color, required String msg}) {
  Fluttertoast.showToast(
    backgroundColor: color,
    msg: msg,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    fontSize: 16,
  );
}
