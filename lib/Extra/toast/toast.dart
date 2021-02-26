import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.white,
      backgroundColor: Colors.redAccent[200],
      gravity: ToastGravity.CENTER);
}
