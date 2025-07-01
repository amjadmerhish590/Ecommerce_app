import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/data/datasource/remote/offers_data.dart';
import 'package:ecommercecourse/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData2 = response['data'];

        data.addAll(listData2.map((e) => ItemsModel.fromJson(e)));
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
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
