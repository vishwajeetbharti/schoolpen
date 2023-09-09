import 'package:flutter/material.dart';

import '../../constants/string.dart';

class CameraProgressIndicator extends StatefulWidget {
  const CameraProgressIndicator(
      {super.key, required this.value, required this.h});
  final double value;
  final double h;

  @override
  CameraProgressIndicatorState createState() => CameraProgressIndicatorState();
}

class CameraProgressIndicatorState extends State<CameraProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  ValueNotifier<int> suggestion = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    // Create an AnimationController with a duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _sizeAnimation = Tween<double>(
      begin: 0,
      end: widget.value,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) {
        int value = ((_sizeAnimation.value * 100) / widget.value).round();
        suggestion.value = value;
        return Column(
          children: [
            Text(
              (value < 30)
                  ? Strings.lookLeft
                  : (value < 60)
                      ? Strings.lookRight
                      : Strings.lookFront,
              style: const TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: widget.h * 0.03,
            ),
            const Text(
              Strings.suggestion,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(
              height: widget.h * 0.025,
            ),
            Text(
              '$value%',
              style: const TextStyle(color: Colors.black87, fontSize: 15),
            ),
            SizedBox(
              height: widget.h * 0.025,
            ),
            Stack(
              children: [
                Container(
                  height: widget.h * 0.02,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE8E8F0),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: widget.h * 0.02,
                  width: _sizeAnimation.value,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: [
                          Color(0xFF6B2ACC),
                          Color(0xABCB63D7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
