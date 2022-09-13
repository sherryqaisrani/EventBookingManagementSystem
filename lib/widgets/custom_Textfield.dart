import 'package:flutter/material.dart';

class CusTomTextFormField extends StatelessWidget {
  String hintTxt;
  TextEditingController controller;

  bool? obscure;
  IconData? suffixIcon;
  VoidCallback? pressed;

  CusTomTextFormField({
    required this.hintTxt,
    this.obscure,
    required this.controller,
    this.suffixIcon,
    this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: controller,
            obscureText: obscure!,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Color(0xff04a4a4),
            decoration: InputDecoration(
                hintText: hintTxt,
                suffixIcon: IconButton(
                  onPressed: pressed,
                  icon: Icon(suffixIcon, color: Color(0xff04a4a4)),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(letterSpacing: 2)),
          )),
    );
  }
}
