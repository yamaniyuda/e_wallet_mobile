import 'package:another_flushbar/flushbar.dart';
import 'package:e_wallet_mobile/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void showCustomSnackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(num number, { String? symbol }) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol ?? '',
    decimalDigits: 0,
  ).format(number);
}

Future<XFile?> selectImage() async {
  XFile? selectImage = await ImagePicker().pickImage(source: ImageSource.camera);
  return selectImage;
}