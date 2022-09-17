import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeAndCalenderController extends GetxController {
  callCalender(
      BuildContext context, TextEditingController textEditingController) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.amberAccent, // <-- SEE HERE
                  onPrimary: Colors.black, // <-- SEE HERE
                  onSurface: Colors.blueAccent,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.black, // button text color
                  ),
                )),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      textEditingController.text = formattedDate;

      print(textEditingController.text);
      update();
    } else {}

    update();
  }
}
