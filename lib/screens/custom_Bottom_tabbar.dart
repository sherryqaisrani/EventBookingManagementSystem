import 'package:eventbookingmanagement/controllers/suggestion_animation_controller.dart';
import 'package:eventbookingmanagement/screens/favourite_screen.dart';
import 'package:eventbookingmanagement/screens/home_screen.dart';
import 'package:eventbookingmanagement/screens/suggestion_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomTabbar extends StatefulWidget {
  @override
  _CustomBottomTabbarState createState() => _CustomBottomTabbarState();
}

class _CustomBottomTabbarState extends State<CustomBottomTabbar> {
  int _currentIndex = 0;
  List _screens = [
    HomeScreen(),
    FavouriteScreen(),
    SuggesstionScreen(),
    //NotificationScreen(),
    //Profile()
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SuggestionAnimationController());
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color(0xff04a4a4),
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,

        selectedItemColor: Color(0xff04a4a4),
        unselectedItemColor: Colors.grey[400],
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: "Suggestions",
            icon: ImageIcon(AssetImage('assets/images/icon.png')),
          ),
          BottomNavigationBarItem(label: "Alerts", icon: Icon(Icons.add_alert)),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
