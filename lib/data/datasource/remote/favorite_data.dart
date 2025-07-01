import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String usersId, String itemsId) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersId, String itemsId) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
