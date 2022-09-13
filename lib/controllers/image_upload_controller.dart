import 'dart:convert';

import 'package:eventbookingmanagement/models/image_upload.dart';
import 'package:eventbookingmanagement/services/api_services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UploadImageController extends GetxController {
  final ApiServices apiServices;
  List<ImageUpload> listImage = [];

  UploadImageController({required this.apiServices});

  uploadImage({required Uint8List image}) async {
    String encodeString = base64Encode(image);
    print(encodeString);
    final response = await apiServices.uploadImage({
      "imageData": encodeString,
    });

    if (response.statusCode == 200) {
      print('******************** Seeing the map retrun from api');
      Map<String, dynamic> map = jsonDecode(response.toString());

      if (map['code'] == 200) {
        listImage = [];
        listImage.add(ImageUpload.fromJson(map['data']));
        // print('****************************** image list');
        // print(listImage[0].imageUrl);
      } else {}
    } else {
      print('****************************8 Error***********************');
    }
    update();
  }
}
