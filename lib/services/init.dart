import 'package:eventbookingmanagement/controllers/event_detail_controller.dart';
import 'package:eventbookingmanagement/controllers/get_event_controller.dart';
import 'package:eventbookingmanagement/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/register_controller.dart';
import 'api_services.dart';
import 'network_client.dart';

Future<void> initData() async {
  Get.lazyPut(() => NetworkClient());

  Get.lazyPut(() => ApiServices(networkClient: NetworkClient()));

  //Start Controller from here
  Get.lazyPut(() => RegisterController(apiServices: Get.find()));

  Get.lazyPut(() => LoginController(apiServices: Get.find()));
  //Get.lazyPut(() => LogoutController(apiServices: Get.find()));
  Get.lazyPut(() => GetEventController(apiServices: Get.find()));
  Get.lazyPut(() => EventDetailController(apiServices: Get.find()));
  Get.lazyPut(() => SearchController(apiServices: Get.find()));

  // Get.lazyPut(() => CreateEventController(apiServices: Get.find()));
  // Get.lazyPut(() => UploadImageController(apiServices: Get.find()));
}
