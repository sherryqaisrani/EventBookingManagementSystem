import 'package:eventbookingmanagement/services/api_services.dart';
import 'package:get/get.dart';

class CreateEventController extends GetxController {
  final ApiServices apiServices;

  CreateEventController({required this.apiServices});

  Future<String> uploadEvent({
    required String eventName,
    required String eventAddress,
    required String numberOfAttendres,
    required String price,
    required String startDate,
    required String endDate,
    required String description,
    final image,
  }) async {
    String finalResponse = 'success';
    final response = await apiServices.createEvent({
      'user_id': 3,
      'category_id': 2,
      'event_name': eventName,
      'event_address': eventAddress,
      'no_of_attendres': numberOfAttendres,
      'price': price,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startDate,
      'end_time': endDate,
      'publication_status': '0',
      'cover_image': image,
      'description': description,
      'NCorrdinate': '48.89493821313934',
      'ECorrdinate': '2.2304132576717977',
    });

    if (response.statusCode == 200) {
      return finalResponse = 'success';
    } else {
      return finalResponse = 'wrong';
      print('****************************** Not Working********************');
    }
  }
}
