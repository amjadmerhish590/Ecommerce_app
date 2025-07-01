import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  Map isFavorite = {};

  // key => id items
  // value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsId,
    );
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("A product has been added to favorites"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsId,
    );
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "Notification",
            messageText:
                const Text("A product has been deleted from your favorites"));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
