import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:ecommercecourse/data/datasource/remote/checkout_data.dart';
import 'package:ecommercecourse/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  List<AddressModel> dataAddress = [];

  MyServices myServices = Get.find();

  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";

  late String couponId;
  late String priceOrders;
  late String couponDiscount;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressId = dataAddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null)
      return Get.snackbar("Erorr", "Please Select A Payment Method");
    if (deliveryType == null) {
      return Get.snackbar("Erorr", "Please Select A Order Type");
    }

    if (dataAddress.isEmpty) {
      return Get.snackbar("Erorr", "Please Select Shipping Address");
    }

    // This is For Code success
    // if (deliveryType == "0") {
    //   if (dataAddress.isEmpty) {
    //     return Get.snackbar("Erorr", "Please Select Shipping Address");
    //   }
    //   if (addressId == "0") {
    //     return Get.snackbar("Erorr", "Please Select A Address");
    //   }
    // }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "usersphone": myServices.sharedPreferences.getString("phone"),
      "addressid": addressId.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "0",
      "ordersprice": priceOrders,
      "couponid": couponId,
      "coupondiscount": couponDiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);

        Get.snackbar("Success", "The Order Was Successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error!!!", "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'];
    priceOrders = Get.arguments['priceorders'];
    couponDiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}
