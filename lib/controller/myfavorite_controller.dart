import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handlingdatacontroller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommercecourse/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("DATA FAVORITE++++++++++++++++++++++++++++++++++");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(int favoriteId) {
    var response = myFavoriteData.deleteData(favoriteId);
    data.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
