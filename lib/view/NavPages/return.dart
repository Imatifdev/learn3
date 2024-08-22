import 'package:flutter/material.dart';

class Returnn extends StatelessWidget {
  const Returnn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'return!',
          style: TextStyle(fontSize: 24), // You can customize the text style
        ),
      ),
    );
  }
}
