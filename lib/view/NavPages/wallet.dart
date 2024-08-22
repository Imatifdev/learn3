import 'package:flutter/material.dart';

class Wallett extends StatelessWidget {
  const Wallett({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'wallet!',
          style: TextStyle(fontSize: 24), // You can customize the text style
        ),
      ),
    );
  }
}
