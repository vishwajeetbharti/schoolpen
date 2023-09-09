import 'package:flutter/material.dart';

import '../constants/string.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({super.key, required this.w, required this.h});
  final double w;
  final double h;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: w,
              height: h * 0.25,
              child: Image.asset(
                'assets/Ellipse 417.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: w,
              height: h * 0.25,
              child: Image.asset(
                'assets/Background.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 150,
        ),
        Image.asset('assets/component.png'),
        const SizedBox(
          height: 30,
        ),
        const Text(
          '28%',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          Strings.fingerPrint,
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          width: w * 0.9,
          height: h * 0.05,
          child: Center(
            child: Text(
              Strings.fingerPrintSuggestion,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: w * 0.04, color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}
