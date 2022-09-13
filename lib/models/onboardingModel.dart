//import 'package:event_booking/views/screens/disclaimer_screen.dart';

import '../utils/app_files.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: "DISCOVER ALL THE EVENTS NOW AROUND YOU",
      image: AppFiles.onbording1,
      discription:
          "You want to take some fresh air but you don't know what to do now ? \n"
          "We make it simple to find events surrounding you, right now"),
  UnbordingContent(
      title: 'WHEREVER & WHENEVER YOU ARE',
      image: AppFiles.onbording2,
      discription:
          "Day & night, in your place or on holidays, in France or abroad ... Don't miss any thing around you!"),
  UnbordingContent(
      title: 'RECEIVE SUGGESTIONS ACCORDING TO YOUR PREFERENCES',
      image: AppFiles.onbording3,
      discription: "Art, sport, music with family, food... \n"
          "According to your choices, dates, places \n"
          "etc... \n"
          "Also add events on your calendar as a reminder. WAZAA will be your best hobby friend!"),
];
