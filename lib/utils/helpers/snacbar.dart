import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, Widget widget) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: widget,
      duration: const Duration(milliseconds: 400),
    ),
  );
}
