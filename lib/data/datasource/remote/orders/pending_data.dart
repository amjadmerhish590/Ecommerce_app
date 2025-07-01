import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "id": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersDelete, {
      "id": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
