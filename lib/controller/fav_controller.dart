import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/favorite_model.dart';
import 'package:ecommerce_app/data/data_source/remote/fav_data.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../data/data_source/model/items_model.dart';

class FavoriteController extends GetxController {
  MyServices myServices=Get.find();
  StatusRequest addFavReq =StatusRequest.none;
  StatusRequest removeFavReq =StatusRequest.none;
  StatusRequest statusRequest=StatusRequest.none;
  FavoriteData favoriteData=FavoriteData(Get.find());

  Map isFavorite = {};


  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }
  addToFav( itemId)async{
    addFavReq=StatusRequest.loading;
    print("1");
    var response=await favoriteData.addFavorite(myServices.sharedPreferences.getString(userId)!,itemId);
    addFavReq=handlingData(response);
    if(StatusRequest.success==addFavReq){
      if (response['status']=="success") {
        getFavItems();

      }else{
        addFavReq=StatusRequest.failure;
        print('failed to add to fav');
      }

    }else{
      return addFavReq;
    }
    update();

  }
  removeFromFav(itemId)async{
    var response=await favoriteData.removeFavorite(myServices.sharedPreferences.getString(userId)! , itemId);
    removeFavReq=handlingData(response);
    if(StatusRequest.success==removeFavReq){
      if (response['status']=="success") {
        getFavItems();

      }else{
        removeFavReq=StatusRequest.failure;
        print('failed to add to fav');
      }

    }else{
      return removeFavReq;
    }
    update();

  }
  List favItems=[];
  late FavoriteModel favoriteModel;

  getFavItems()async{
    favItems.clear();
    var response=await favoriteData.getAllFavorites(myServices.sharedPreferences.getString(userId)! );
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if (response['status']=="success") {
        favItems.addAll(response['data']);
        print('got fav items ${favItems}');

      }else{
        statusRequest=StatusRequest.failure;
        print('failed to add to fav');
      }

    }else{
      return statusRequest;
    }
    update();

  }
  @override
  void onInit() {
    getFavItems();
    super.onInit();
  }


}