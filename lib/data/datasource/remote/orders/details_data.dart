import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersDetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
