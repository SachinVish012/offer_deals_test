import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastGreen(String? text) {
  if (text != null) {
    Fluttertoast.showToast(
      msg: text,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green.shade200,
    );
  }
}

void toastRedC(String? text) {
  if (text != null) {
    Fluttertoast.showToast(
      msg: text,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.redAccent,
    );
  }
}
