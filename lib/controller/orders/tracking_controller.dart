import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/polyline.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController{


  GoogleMapController? gmc;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;

  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;

  double? destLat;
  double? destLong;

  double? currentLat;
  double? currentLong;


  Set<Polyline> polylineSet = {};

  MyServices myServices = Get.find();


  initialData() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );

    markers.add(Marker(
        markerId: MarkerId("Current"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
  }


  initPolyline() async{
    destLat = double.parse(ordersModel.addressLat.toString());
    destLong = double.parse(ordersModel.addressLong.toString());
    await Future.delayed( Duration(seconds: 5));
    polylineSet = await getPolyline(currentLat, currentLong, destLat, destLong);
    update();
  }

  getLocationDelivery(){
    FirebaseFirestore.instance.collection("delivery").doc(ordersModel.ordersId.toString()).snapshots().listen((event) {

      if(event.exists){
        destLat = event.get("lat");
        destLong = event.get("long");
        print(")))))))))))))))))))))))))))))))) $destLong");
        updateMarkerDelivery(destLat!, destLong!);
      }

    });
  }

  updateMarkerDelivery(double newLat, double newLong) {
    markers.removeWhere((element) => element.markerId.value == "Destination");

    markers.add(Marker(
        markerId: MarkerId("Destination"),
        position: LatLng(newLat, newLong),
      // icon:  BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)

    ));
    update();
  }


  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getLocationDelivery();
    // initPolyline();
    super.onInit();
  }
  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
}

// 1- get current postion
// 2- tracking