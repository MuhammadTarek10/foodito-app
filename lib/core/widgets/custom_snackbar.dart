import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String message,
  bool isError = false,
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      backgroundColor: isError == false ? color ?? Colors.green : Colors.red,
    ),
  );
}
