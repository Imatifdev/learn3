import 'package:flutter/material.dart';

class CustomSnackbar {
  final String message;

  CustomSnackbar(this.message);
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "Message",
          onPressed: () {},
        ),
      ),
    );
  }
}
