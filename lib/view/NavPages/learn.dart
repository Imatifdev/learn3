import 'package:flutter/material.dart';

class Learnn extends StatefulWidget {
  const Learnn({super.key});

  @override
  State<Learnn> createState() => _LearnnState();
}

class _LearnnState extends State<Learnn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'learn!',
          style: TextStyle(fontSize: 24), // You can customize the text style
        ),
      ),
    );
  }
}
