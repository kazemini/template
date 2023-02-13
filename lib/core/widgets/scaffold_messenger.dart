import 'package:flutter/material.dart';
// TODO clean arch :)
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> scaffoldMessenger(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
      elevation: 10,
      duration: const Duration(seconds: 2),
    ),
  );
}
