import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(AppLink.ordersArchive, {
      "id": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  rating(String ordersid, String comment, String rating) async {
    var response = await crud.postData(AppLink.rating, {
      "ordersid": ordersid,
      "rating": rating,
      "comment": comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
