import 'package:eventbookingmanagement/models/event_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
  List<EventData> favourtList = [];
  // List<String>? favList = [];

  addFavourt(EventData eventData) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (favourtList.contains(eventData)) {
      favourtList.remove(eventData);
    } else {
      favourtList.add(eventData);
      //    sharedPreferences.setStringList('favouriteList', [eventData.toString()]);
      //  favList = sharedPreferences.getStringList('favouriteList');

      //print(favList);
      update();
    }
    update();
  }
}
