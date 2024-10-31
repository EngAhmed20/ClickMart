import 'package:ecommerce_app/controller/search_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/data_source/remote/offers_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/data_source/model/items_model.dart';

class OffersItemsController extends MixinSearchOfferController{
  OffersData offersData=OffersData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  List<ItemsModel> data=[];
  getData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await offersData.getData();
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']=='success')
        {
          List offerData=response['data'];
          data.addAll(offerData.map((e)=>ItemsModel.fromJson(e)));

        }
    }else{
      // Handle error
      return statusRequest;
    }
    update();
  }

  goTodetailsPage(ItemsModel item) {
    Get.toNamed('/details',arguments: {
      'item':item
    });}



  @override
  void onInit() async{
    await getData();
    super.onInit();
    searchController=TextEditingController();
  }
}