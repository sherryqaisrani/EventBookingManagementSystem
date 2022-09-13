import 'package:eventbookingmanagement/screens/login_Screen.dart';
import 'package:eventbookingmanagement/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  final ApiServices apiServices;

  LogoutController({required this.apiServices});
  Future<void> logout() async {
    final response = await apiServices.logout();

    if (response.statusCode == 200) {
      print('Login Not Working.................');
      SharedPreferences sharedP = await SharedPreferences.getInstance();

      sharedP.remove('userToken');

      Get.snackbar(
        "Log out ",
        "Successfully  ..",
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        duration: Duration(seconds: 2),
      );

      Get.offAll(Login());
    } else {
      print('Login Not Working................. So SAd');
    }
  }
}
