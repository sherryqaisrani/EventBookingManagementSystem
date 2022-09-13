import 'package:eventbookingmanagement/models/event_model.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<EventData> favourtList = [];

  addFavourt(EventData eventData) {
    if (favourtList.contains(eventData)) {
      favourtList.remove(eventData);
    } else {
      favourtList.add(eventData);
    }
    update();
  }
}
