import 'package:ecommerce_app/controller/search_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/home_string_model.dart';
import 'package:ecommerce_app/data/data_source/model/items_model.dart';
import 'package:ecommerce_app/data/data_source/remote/home_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends MixinSearchController{
getData();
goTodetailsPage(ItemsModel item);
goToItemsPage(List categories,int selectedCategories,String cat_id);
goToFavPage();}
class HomeControllerImpl extends HomeController{
  MyServices myServices =Get.find();
  StatusRequest statusRequest=StatusRequest.none;
   TextEditingController? searchController;
  HomeData homeData=HomeData(Get.find());
  List categories=[];
  HomeStringModel? homeText;
  List items=[];
  String? id;
  String? name;
  String? email;
  String?phone;
  String? lang;
  @override
  void onInit() {
    searchController=TextEditingController();
    id=myServices.sharedPreferences.getString(userId);
    name=myServices.sharedPreferences.getString('userName');
    email=myServices.sharedPreferences.getString('userEmail');
    phone=myServices.sharedPreferences.getString('userPhone');
    lang=myServices.sharedPreferences.getString('lang');
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance.subscribeToTopic("users${id}");

    getData();

  }


  @override
  getData() async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await homeData.getCategories();
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        homeText=HomeStringModel.fromJson(response['text']);
         myServices.sharedPreferences.setString('delivery time', response['text']['delivery_time']);

      }else{
        statusRequest=StatusRequest.failure;
      }
    }
    update();

  }

  @override
  goToItemsPage(categories, selectedCategories, categoryId) {
    Get.toNamed('/items',arguments: {
      'categories': categories,
      'selectedCat':selectedCategories,
      'categoryId':categoryId,

  }
    );


    }

  @override
  goToFavPage() {
   Get.toNamed('/fav');
  }


  @override
  goTodetailsPage(ItemsModel item) {
    Get.toNamed('/details',arguments: {
      'item':item
    });
  }
}