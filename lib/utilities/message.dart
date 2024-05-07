import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'appcolors.dart';



void success(BuildContext context, {required String message}) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.BOTTOM,
    icon: Icon(
      Icons.done,
      size: 28.0,
      color: AppColor.primaryColor,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: AppColor.primaryColor,
  ).show(context);
}


void error(BuildContext context, {required String message}) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.BOTTOM,
    icon: Icon(
      Icons.error,
      size: 28.0,
      color: AppColor.red,
    ),
    duration: const Duration(seconds: 3),
    leftBarIndicatorColor: AppColor.red,
    backgroundColor: AppColor.black,
  ).show(context);

}
