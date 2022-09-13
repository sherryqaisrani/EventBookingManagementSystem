import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  late String textLable;
  late Color bgCol;

  Tags({required this.textLable, required this.bgCol});

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: const StadiumBorder(side: BorderSide(color: Color(0xff04a4a4))),
      label: Text(textLable),
      backgroundColor: bgCol,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }
}
