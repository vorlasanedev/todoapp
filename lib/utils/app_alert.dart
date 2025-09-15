import 'package:flutter/material.dart';
import 'package:todoapp/utils/extensions.dart';

class AppAlert {
  AppAlert._();

  static void displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: context.textTheme.bodyLarge)),
    );
  }
}
