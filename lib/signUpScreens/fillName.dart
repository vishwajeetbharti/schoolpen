import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolpen/signUpScreens/widgets/button.dart';

import '../bloc/bloc.dart';
import '../constants/string.dart';

class FillName extends StatelessWidget {
  const FillName(
      {super.key, required this.w, required this.h, required this.controller});
  final double w;
  final double h;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: w,
              height: h * 0.35,
              child: Image.asset(
                'assets/Ellipse 417.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: w,
              height: h * 0.25,
              child: Image.asset(
                'assets/Background1.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: w * 0.25, top: h * 0.19),
              child: Image.asset(
                'assets/thinkingIllustration.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: w * 0.9,
          child: const Text(
            Strings.askName,
            style: TextStyle(fontSize: 30, color: Color(0xFF9163D7)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            height: h * 0.07,
            width: w * 0.9,
            decoration: BoxDecoration(
                color: const Color(0xFFE8E8F0),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      hintText: Strings.hintText,
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none),
                ),
              ),
            )),
        const Spacer(
          flex: 1,
        ),
        Button(
          width: w * 0.9,
          height: h * 0.07,
          onTap: () {
            if (controller.text.isNotEmpty) {
              signUpBloc.add(GetRegionEvent(userName: controller.text));
            } else {
              Fluttertoast.showToast(msg: 'Enter Name');
            }
          },
          buttonName: Strings.nextButton,
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
