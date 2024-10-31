import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/items_model.dart';
import 'package:ecommerce_app/data/data_source/remote/fav_data.dart';
import 'package:ecommerce_app/data/data_source/remote/items_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_string.dart';

abstract class ItemsController extends GetxController{
  getInitData();
  changeSelectedCat(int index,String categoryId);
  getItems( );
  goTodetailsPage(ItemsModel item);
  changefavIcon();

}
class ItemsControllerImpl extends ItemsController{
  MyServices myServices=Get.find();
  List categories=[];
  int? selectedCat;
  String? catId;
  List items=[];
  bool favItem=false;

  ItemsData itemsData=ItemsData(Get.find());
  StatusRequest statusRequest =StatusRequest.none;
  @override
  getInitData() {
    categories=Get.arguments['categories'];
    selectedCat=Get.arguments['selectedCat'];
    catId=Get.arguments['categoryId'];
    print('selested cat ${selectedCat}');
  }
  @override
  void onInit() {
    getInitData();
    getItems();
  }

  @override
  changeSelectedCat(index,categoryId) {
   selectedCat=index;
   catId=categoryId;
   getItems();
   update();
  }

  @override
  getItems() async{
    items.clear();
   statusRequest=StatusRequest.loading;
   var response=await itemsData.getData(catId!,myServices.sharedPreferences.getString(userId)!);
   statusRequest=handlingData(response);
   if(StatusRequest.success==statusRequest)
     {
       if(response['status']=="success")
         {
           items.addAll(response['data']);
         }
       
     }else{
     statusRequest=StatusRequest.failure;


   }
   update();
   
  }

  @override
  goTodetailsPage(ItemsModel item) {
    Get.toNamed('/details',arguments: {
      'item':item
    });
  }
////////////fav
  @override
  changefavIcon() {
    favItem=!favItem;
    update();
  }




}