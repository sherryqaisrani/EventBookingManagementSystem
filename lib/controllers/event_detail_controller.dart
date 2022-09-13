import 'dart:convert';

import 'package:eventbookingmanagement/models/event_model.dart';
import 'package:eventbookingmanagement/services/api_services.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
  final ApiServices apiServices;

  EventDetailController({required this.apiServices});
  List<EventData> listOfEventDetail = [];

  eventDetail(int eventID) async {
    listOfEventDetail.clear();
    final response = await apiServices.eventDetail(eventID);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      if (map['code'] == 200) {
        listOfEventDetail.add(EventData.fromJson(map['data']));
        // Get.to(EventDetailScreen());
      }
    } else {
      print('***************************** No Data Fetched');
    }
    update();
  }
}
