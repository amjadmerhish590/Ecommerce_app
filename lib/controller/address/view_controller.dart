import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:ecommercecourse/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(int addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
