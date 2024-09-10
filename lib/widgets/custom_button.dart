import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn3/utils/const_values.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;

  final Color? borderColor;
  final double borderRadius;
  final double padding;
  final double height;
  final double width;
  final bool? icon;
  const CustomButton({
    Key? key,
    this.borderColor,
    this.icon,
    required this.text,
    this.onPressed,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.textColor = Colors.white,
    this.padding = 16.0,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff2C5680)),
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(text,
                  style: AppConstants.bodyText(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            if (icon == true) const Icon(CupertinoIcons.right_chevron)
          ],
        ),
      ),
    );
  }
}
