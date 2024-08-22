
import 'package:flutter/material.dart';

import '../utils/const_values.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  CustomAlertDialog({
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Column(
        children: [
          Icon(
            Icons.verified_user_outlined,
            color: AppConstants.primaryColor,
            size: 50,
          ),
          SizedBox(
            height: 20,
          ),
          Text(title),
        ],
      )),
      content: Text(textAlign: TextAlign.center, message),
      actions: [
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: onCancel,
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 70,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor),
              onPressed: onConfirm,
              child: Text(
                'Confirm',
                style: TextStyle(color: AppConstants.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
