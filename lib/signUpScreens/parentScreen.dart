import 'package:flutter/material.dart';
import 'package:schoolpen/signUpScreens/widgets/button.dart';

import '../constants/string.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key, required this.w, required this.h});
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
              height: h * 0.35,
              child: Image.asset(
                'assets/Ellipse 417.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: w,
              height: h * 0.29,
              child: Image.asset(
                'assets/Background1.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: w * 0.25, top: h * 0.2),
              child: Image.asset(
                'assets/thinkingIllustration.png',
                scale: 1,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: w * 0.9,
          child: const Text(
            Strings.askUserType,
            style: TextStyle(fontSize: 30, color: Color(0xFF9163D7)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: w * 0.9,
          height: h * 0.25,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                colors: [
                  Color(0xFF6B2ACC),
                  Color(0xABCB63D7),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Mask_group_parent.png'),
                  Image.asset('assets/Ellipse.png'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    Strings.parent,
                    style: TextStyle(color: Colors.white, fontSize: w * 0.07),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: h * 0.15,
                    width: w * 0.5,
                    child: Text(
                      Strings.parentsQuotes,
                      style: TextStyle(color: Colors.white, fontSize: w * 0.04),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Button(
          width: w * 0.9,
          height: h * 0.07,
          onTap: () {},
          buttonName: Strings.submitButton,
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
