import 'package:flutter/material.dart';

class AppConstants {
  static TextStyle heading1({
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 24.0,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle heading2({
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 22.0,
      fontWeight: fontWeight,
      color: color ?? white,
    );
  }

  static TextStyle heading3({
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 20.0,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle heading4({
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18.0,
      fontWeight: fontWeight,
      color: color ?? white,
    );
  }

  static TextStyle bodyText({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16.0,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle buttonText({
    double? fontSize,
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18.0,
      fontWeight: fontWeight,
      color: color ?? Colors.white,
    );
  }

  static Color primaryColor = const Color(0xffE6007E);
  static Color secondaryColor = const Color(0xff969ECD);
  static Color textColor = const Color(0xff677294);
  static Color lightGreen = const Color(0xffe3f2df);
  static Color white = Colors.white;
  static Color black = Colors.black;

  static Color backgroundColor = Colors.grey.shade100;
}
