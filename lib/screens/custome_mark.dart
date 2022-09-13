import 'dart:async';

import 'package:eventbookingmanagement/controllers/get_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomeMarker extends StatelessWidget {
  CustomeMarker({super.key});

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kgooglePlex = CameraPosition(
      target: LatLng(48.82886530948561, 2.3599329306918033), zoom: 12.4746);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      myLocationEnabled: true,
      markers: Set<Marker>.of(Get.find<GetEventController>().marker),
      initialCameraPosition: _kgooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
