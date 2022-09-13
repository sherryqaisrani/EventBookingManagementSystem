import 'package:flutter/material.dart';

class AnimatedProgressBar extends AnimatedWidget {
  AnimatedProgressBar({required Animation<double>? animation})
      : super(listenable: animation!);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      height: 4.0,
      width: animation.value,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
          color: Colors.white),
    );
  }
}
