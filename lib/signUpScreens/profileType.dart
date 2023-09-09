import 'package:flutter/material.dart';
import 'package:schoolpen/signUpScreens/widgets/button.dart';

import '../bloc/bloc.dart';
import '../constants/string.dart';

class ProfileSelection extends StatelessWidget {
  const ProfileSelection({super.key, required this.w, required this.h});
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
          height: 50,
        ),
        SizedBox(
          width: w * 0.9,
          child: const Text(
            Strings.askUserType,
            style: TextStyle(fontSize: 30, color: Color(0xFF9163D7)),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Button(
              width: w * 0.4,
              height: h * 0.06,
              onTap: () {
                signUpBloc.add(StudentEvent());
              },
              buttonColor: const Color(0xFFE7D8F8),
              buttonName: Strings.student,
              textColor: Colors.black,
            ),
            Button(
              width: w * 0.4,
              height: h * 0.06,
              onTap: () {
                signUpBloc.add(TeacherEvent());
              },
              buttonColor: const Color(0xFFE7D8F8),
              buttonName: Strings.teacher,
              textColor: Colors.black,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Button(
              width: w * 0.4,
              height: h * 0.06,
              onTap: () {
                signUpBloc.add(ParentEvent());
              },
              buttonColor: const Color(0xFFE7D8F8),
              buttonName: Strings.parent,
              textColor: Colors.black,
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Button(
          width: w * 0.9,
          height: h * 0.07,
          onTap: () {},
          buttonName: 'Submit',
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
