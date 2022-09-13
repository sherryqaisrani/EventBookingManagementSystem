import 'package:eventbookingmanagement/screens/splash_screen.dart';
import 'package:eventbookingmanagement/services/init.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
