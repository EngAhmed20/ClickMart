import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/order_model.dart';
import 'package:ecommerce_app/data/data_source/remote/order_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/add_remove_cart_snackbar.dart';
import '../../data/data_source/remote/order_rating_data.dart';

class OrderController extends GetxController{
  OrderData orderData=OrderData(Get.find());
  OrderRatingData orderRatingData=OrderRatingData(Get.find());
  MyServices myServices=Get.find();
  StatusRequest statusRequest=StatusRequest.none;
  StatusRequest archiveStatus=StatusRequest.none;



  List <OrderModel>data=[];
  getPendingData()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    update();

    var response=await orderData.getData(myServices.sharedPreferences.getString(userId)!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        List listData=response['data'];
        data.addAll(listData.map((e)=>OrderModel.fromJson(e)));

      }else{
        statusRequest=StatusRequest.failure;

      }

    }else{
      statusRequest=StatusRequest.failure;

    }
    update();

  }
  deleteOrder(String orderId)async{
    statusRequest=StatusRequest.loading;
    update();

    var response=await orderData.deleteOrder(orderId);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        add_removeSnack('delete order');
        getPendingData();


      }else{
        add_removeSnack('cant delete order',icon:Icons.error_outline,iconColor: Colors.red);


      }

    }
    update();

  }
  refreshPage()async{
    await getPendingData();
  }
  getOrderStatus(int val)
  {
    if(val ==0){
      return 'await approval'.tr;
    }else if(val ==1){
      return 'order prepared'.tr;
    }
    else if (val ==2){
      return 'deliver order'.tr;
    }else if (val ==3){
      return 'on the way'.tr;

    }
    else{
      return 'order delivered'.tr;
    }

  }
  List<OrderModel>archivedData=[];
  getArchiveOrder()async{
    archivedData.clear();
    archiveStatus=StatusRequest.loading;
    update();

    var response=await orderData.getArchiveData(myServices.sharedPreferences.getString(userId)!);
    archiveStatus=handlingData(response);
    if(StatusRequest.success==archiveStatus){
      if(response['status']=='success'){
        List listData=response['data'];
        archivedData.addAll(listData.map((e)=>OrderModel.fromJson(e)));

      }else{
        archiveStatus=StatusRequest.failure;

      }

    }else{
      archiveStatus=StatusRequest.failure;

    }
    update();

  }
  deleteArchivedOrder(String orderId)async{
    statusRequest=StatusRequest.loading;
    update();

    var response=await orderData.deleteArchivedOrder(orderId);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        add_removeSnack('delete order');
        getArchiveOrder();


      }else{


      }

    }
    update();

  }
  rateArchivedOrder(String orderId,rating,ratingMsg)async{
    statusRequest=StatusRequest.loading;
    update();

    var response=await orderRatingData.sendRatingData(orderId,rating,ratingMsg);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        add_removeSnack('msg after rate');
      }else{


      }

    }
    update();


  }


  @override
  void onInit() {
    getPendingData();
    getArchiveOrder();
    super.onInit();
  }

}