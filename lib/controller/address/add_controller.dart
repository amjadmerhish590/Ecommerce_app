import 'dart:async';

import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completerController;

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressAddDetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  Position? position;

  CameraPosition? kGooglePlex;

  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );

    addMarkers(LatLng(position.latitude, position.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
