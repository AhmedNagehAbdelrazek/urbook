import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void showUnExpectedErrorToast() {
    Fluttertoast.showToast(
      msg: "Unexpected Error",
      backgroundColor: const Color(0xFFDC3545),
      textColor: Colors.white,
      fontSize: 14,
      timeInSecForIosWeb: 4,
    );
  }

  static void showErrorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: const Color(0xFFDC3545),
      textColor: Colors.white,
      fontSize: 14,
      timeInSecForIosWeb: 4,
    );
  }

  static void showSuccessToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.green[800],
      textColor: Colors.white,
      fontSize: 14,
      timeInSecForIosWeb: 4,
    );
  }
}