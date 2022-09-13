import 'package:eventbookingmanagement/widgets/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  Uint8List? imageURL;

  imagePicker(ImageSource imageSource) async {
    imageURL = await pickImage(imageSource);
    update();
  }
}
