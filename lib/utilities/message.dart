import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'appcolors.dart';



void success(BuildContext context, {required String message}) {
  QuickAlert.show(
    backgroundColor: AppColor.primaryColor,
    context: context,
    type: QuickAlertType.success,
    text: message,
    autoCloseDuration: const Duration(seconds: 2),
    showConfirmBtn: false,
  );
}


void error(BuildContext context, {required String message}) {
  QuickAlert.show(
    backgroundColor: AppColor.red,
    context: context,
    type: QuickAlertType.error,
    text: message,
    autoCloseDuration: const Duration(seconds: 2),
    showConfirmBtn: false,
  );

}
