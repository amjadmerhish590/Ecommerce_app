import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersId, String itemsId) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersId, String itemsId) async {
    var response = await crud.postData(AppLink.cartDelete, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersId, String itemsId) async {
    var response = await crud.postData(AppLink.cartGetCountItems, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersId) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponname": couponname,
    });
    return response.fold((l) => l, (r) => r);
  }
}
