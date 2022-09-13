import 'package:flutter/material.dart';

class SocialCustomButton extends StatelessWidget {
  late Color bgColor;
  late Color borderColor;
  late Color textColor;
  late String imgIcon;

  SocialCustomButton(
      {required this.bgColor,
      required this.borderColor,
      required this.textColor,
      required this.imgIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: bgColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: Image(

            image: AssetImage(imgIcon))));
  }
}
