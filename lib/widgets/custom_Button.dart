import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonTitle;
  late Color bgColor;
  late Color borderColor;
  late Color textColor;

  CustomButton({
    required this.buttonTitle,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: bgColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(color: textColor, fontSize: 15),
        )));
  }
}
