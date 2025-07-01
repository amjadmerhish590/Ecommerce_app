import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());

  int countItems = 0;

  addItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      itemsId,
    );
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText: const Text("A product has been added to My Cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
      myServices.sharedPreferences.getString("id")!,
      itemsId,
    );
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification",
            messageText:
                const Text("A product has been deleted from your Cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
      myServices.sharedPreferences.getString("id")!,
      itemsId,
    );
    print(
        "+++++++++++++++++++++++++++++++++++++ Controller $response+++++++++");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countItems = 0;
        countItems = response['data'];
        print("========================================================");
        print(countItems);
        return countItems;

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  List subItems = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Black", "id": 2, "active": "0"},
    {"name": "Blue", "id": 3, "active": "1"},
  ];

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countItems = await getCountItems(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  add() {
    addItems(itemsModel.itemsId.toString());
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      deleteItems(itemsModel.itemsId.toString());
      countItems--;
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
