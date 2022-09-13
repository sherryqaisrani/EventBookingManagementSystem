import 'dart:convert';

import 'package:eventbookingmanagement/models/search_model.dart';
import 'package:eventbookingmanagement/services/api_services.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  bool serach = false;

  final ApiServices apiServices;

  var searchList = [];

  SearchController({required this.apiServices});

  cancelButton() {
    serach = false;
    searchList = [];
    update();
  }

  Future<String> searchEvent({required String eventName}) async {
    String finalRespone = '';
    if (eventName.isNotEmpty) {
      serach = false;
      searchList = [];
      String searchResponse = '';
      final response = await apiServices.searchEvent({
        'search_string': eventName,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.toString());
        if (map['code'] == 200) {
          // searchList = [];
          // searchList.add(SearchData.fromJson(map['data']));
          serach = !serach;
          print(serach);
          searchList =
              (map['data'] as List).map((e) => SearchData.fromJson(e)).toList();

          update();
        }
        update();
        return searchResponse = 'success';
      }
      return searchResponse = 'failed';
    }
    return finalRespone;
  }
}
