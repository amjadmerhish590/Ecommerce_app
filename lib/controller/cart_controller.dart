import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_data.dart';
import 'package:ecommercecourse/data/model/cartmodel.dart';
import 'package:ecommercecourse/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? controllerCoupon;
  CouponModel? couponModel;

  CartData cartData = CartData(Get.find());
  int? discountCoupon = 0;
  String? couponName;
  String? couponId;

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceOrders = 0.0;
  int totalCountItems = 0;

  add(String itemsId) async {
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

  delete(String itemsId) async {
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

  resetVarCart() {
    totalCountItems = 0;
    priceOrders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print(
        "+++++++++++++++++++++++++++++++++++++ Controller $response+++++++++");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataResponse = response['datacart']['data'];
          Map dataResponseCountPrice = response['countprice'];
          data.clear();
          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
          // totalCountItems = int.parse(dataResponseCountPrice['totalcount']);

          //for type poduct, how many product have you
          totalCountItems = dataResponseCountPrice['totalcount'];

          priceOrders = dataResponseCountPrice['totalprice'].toDouble();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getTotalPrice() {
    return (priceOrders - priceOrders * discountCoupon! / 100);
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        //this is for String in model
        // discountCoupon = int.parse(couponModel.couponDiscount);
        discountCoupon = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        // statusRequest = StatusRequest.failure;
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("Warning!", "Coupon Not Valid");
      }
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty)
      return Get.snackbar("Warning", "Your shopping cart is empty");
    Get.toNamed(AppRoute.checkOut, arguments: {
      "couponid": couponId ?? "0",
      "priceorders": priceOrders.toString(),
      "discountcoupon": discountCoupon.toString()
    });
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    super.onInit();
  }
}
