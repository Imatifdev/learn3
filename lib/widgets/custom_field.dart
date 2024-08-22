
import 'package:flutter/material.dart';

import '../utils/const_values.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final int? lines;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction action;
  final String? initialValue;
  final IconButton? icon;
  const CustomTextFormField(
      {super.key,
       this.controller,
      this.labelText,
      this.hintText,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.validator,
      this.onChanged,
      required this.action,
      this.initialValue,
      this.icon,
      this.lines});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    final Color containerColor =
        isDarkMode ? Color(0xFFFFC0CB) : theme.primaryColor;
    final Color textFieldFillColor =
        isDarkMode ? Colors.grey.withOpacity(0.2) : Colors.white;
    final Color textFieldBorderColor =
        isDarkMode ? Colors.grey : theme.primaryColor.withOpacity(0.2);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        maxLines: lines,
        initialValue: initialValue,
        textInputAction: action,
        controller: controller,
        decoration: InputDecoration(
          fillColor: textFieldFillColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: icon,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          labelText: labelText,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      textFieldBorderColor), // Customize the focused border color
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      textFieldBorderColor), // Customize the focused border color
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color:
                    AppConstants.white), // Customize the focused border color
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
