import 'dart:convert';
import 'package:eventbookingmanagement/controllers/event_detail_controller.dart';
import 'package:eventbookingmanagement/models/event_model.dart';
import 'package:eventbookingmanagement/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class GetEventController extends GetxController {
  final ApiServices apiServices;
  GetEventController({required this.apiServices});

  List<Data> list = [];
  var listEvent = [];

  List<Marker> marker = [];
  List<String> images = [
    'assets/images/marker.png',
  ];

  List<List<String>> listOfLatiandLng = [];

  List<String> latList = [];
  List<String> longList = [];

  eventData() async {
    final response = await apiServices.getEvents();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      if (map['code'] == 200) {
        // list = [];
        listEvent = [];
        // marker = [];
        list.add(Data.fromJson(map['data']));

        for (int i = 0; i < list.length; i++) {
          for (int j = 0; j < list[i].data!.length; j++) {
            listEvent.add(list[i].data![j]);
          }
          print(
              '**************************8 checking inside list data**********');
          print(list[i].data!.length);
        }
        for (int i = 0; i < listEvent.length; i++) {
          listOfLatiandLng
              .add([listEvent[i].nCorrdinate, listEvent[i].eCorrdinate]);

          latList.add(listEvent[i].nCorrdinate);
          longList.add(listEvent[i].eCorrdinate);
        }

        print('**********************printing list of evetns');
        print(listEvent.length);
        // print(list.length);

        final Uint8List markerIcon = await getBytesFromAssets(images[0], 70);

        for (int i = 0; i < listEvent.length; i++) {
          marker.add(
            Marker(
              markerId: MarkerId(
                i.toString(),
              ),
              onTap: () {
                Get.to(
                  Get.find<EventDetailController>()
                      .eventDetail(listEvent[i].id),
                );
                print('priting the index');
                print(listEvent[i].id);
              },
              icon: BitmapDescriptor.fromBytes(markerIcon),
              infoWindow: InfoWindow(onTap: () => {}),
              position: LatLng(
                  double.parse(
                    Get.find<GetEventController>().latList[i],
                  ),
                  double.parse(Get.find<GetEventController>().longList[i])),
            ),
          );
        }
      } else {}
      update();
    }
  }

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
