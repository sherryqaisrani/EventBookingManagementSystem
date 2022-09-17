import 'dart:async';

import 'package:eventbookingmanagement/controllers/favourite_controller.dart';
import 'package:eventbookingmanagement/controllers/get_event_controller.dart';
import 'package:eventbookingmanagement/screens/disclaimer_screen.dart';
import 'package:eventbookingmanagement/utils/app_colors.dart';
import 'package:eventbookingmanagement/utils/app_files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    userLogin();
  }

  userLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? userToken = preferences.getString('userToken');

    Timer(const Duration(seconds: 3), () {
      Get.offAll(OnBordingScreen());
      if (userToken == null) {
        Get.offAll(OnBordingScreen());
      } else {
        Get.offAll(Disclaimer());
      }
    });
  }

  Widget build(BuildContext context) {
    Get.find<GetEventController>().eventData();
    Get.put(FavouriteController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: primaryColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppFiles.splashImage,
            ),
          ),
        ),
      ),
    );
  }
}
