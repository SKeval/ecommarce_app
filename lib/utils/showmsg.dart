import 'package:ecommarce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showMsg(String value) {
  return Fluttertoast.showToast(
      msg: value,
      fontSize: 15,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.black,
      backgroundColor: primaryColor);
}
