
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../const/color.dart';

class CommonToast {
  static toastErrorMessage(String message) {
    Fluttertoast.showToast(
      backgroundColor: Colors.red,
      msg: message,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.SNACKBAR,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static toastSuccessMessage(message) {
    Fluttertoast.showToast(
      backgroundColor: Colors.green,
      msg: message,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
