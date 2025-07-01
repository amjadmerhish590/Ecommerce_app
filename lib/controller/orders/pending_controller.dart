import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/orders/pending_data.dart';
import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());
  List<OrdersModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  goToPageTracking(OrdersModel ordersModel){
    Get.toNamed(AppRoute.ordersTracking, arguments: {
      "ordersmodel": ordersModel
    });
  }

  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order Is Being Prepared";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery Man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrders();
  }

  deleteOrder(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.deleteData(orderid);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
