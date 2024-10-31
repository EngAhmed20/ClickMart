import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getCategories() async {
    var response = await crud.postData(AppLinks.homeLink, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLinks.searchLink, {'search': search,});
    return response.fold((l) => l, (r) => r);
  }
  searchOfferData(String search) async {
    var response = await crud.postData(AppLinks.searchOfferLink, {'search': search});
    return response.fold((l) => l, (r) => r);
  }
}
