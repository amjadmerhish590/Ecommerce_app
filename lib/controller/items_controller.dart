import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val, String catVal);
  getItems(String categoryId);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? catId;

  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  String deliveryTime = "";

  @override
  initialData() {
    deliveryTime = myServices.sharedPreferences.getString("deliveryTime")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['categoryId'];
    getItems(catId!);
  }

  @override
  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryId, myServices.sharedPreferences.getString("id")!);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    initialData();
    search = TextEditingController();

    super.onInit();
  }
}
