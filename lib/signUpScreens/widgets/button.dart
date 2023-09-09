import 'package:flutter/material.dart';

//-----------------------Button--------------------------
class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.width,
      required this.height,
      required this.onTap,
      required this.buttonName,
      this.buttonColor = const Color(0xFF9163D7),
      this.textColor = Colors.white});
  final double width;
  final double height;
  final String buttonName;
  final Color buttonColor;
  final Color textColor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
