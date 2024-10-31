import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);
  addFavorite(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.addFavLink, {
      'usersid': userId,
      'itemsid': itemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userId, String itemId) async {
    var response = await crud.postData(AppLinks.deleteFavLink, {
      'usersid': userId,
      'itemsid': itemId,
    });
    return response.fold((l) => l, (r) => r);
  }
  getAllFavorites(String userId) async {
    var response = await crud.postData(AppLinks.favLink,{
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
