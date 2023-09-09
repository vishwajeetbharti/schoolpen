import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolpen/signUpScreens/widgets/button.dart';

import '../blocRepo/bloc/bloc.dart';
import '../constants/string.dart';

class Region extends StatelessWidget {
  const Region(
      {super.key,
      required this.w,
      required this.h,
      required this.controller,
      required this.name});
  final double w;
  final double h;
  final String name;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/seeing.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: w * 0.9,
            child: Text(
              'Welcome $name,\n${Strings.askRegion}',
              style: const TextStyle(fontSize: 30, color: Color(0xFF9163D7)),
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
          SizedBox(
            height: (h < 800) ? (h * 0.16) : (h * 0.19),
          ),
          Button(
            width: w * 0.9,
            height: h * 0.07,
            onTap: () {
              if (controller.text.isNotEmpty) {
                signUpBloc.add(ChooseProfileEvent(region: controller.text));
              } else {
                Fluttertoast.showToast(msg: 'Enter Region');
              }
            },
            buttonName: Strings.nextButton,
          ),
        ],
      ),
    );
  }
}
