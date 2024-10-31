import 'dart:async';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/address_model.dart';
import 'package:ecommerce_app/data/data_source/remote/address_data.dart';
import 'package:ecommerce_app/data/data_source/remote/checkout_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_string.dart';
import '../core/functions/add_remove_cart_snackbar.dart';
import '../core/functions/handling_data_controller.dart';

class CheckoutController extends GetxController{
  AddressData addressData=AddressData(Get.find());
  CheckoutData checkoutData=CheckoutData(Get.find());
  StatusRequest statusRequest =StatusRequest.none;
  MyServices myServices=Get.find();
  String?paymentMethod;
  String? deliveryType;
  int? addressId;
  int? couponId;
  double? priceOrder;
  int? orderDelivery;

  choosePaymentMethod(String val){
    paymentMethod = val;
    update();
  }
  chooseDeliveryType(String val){
    deliveryType = val;
    if(deliveryType=="home delivery")
      {
        orderDelivery=50;
      }
    else{
      orderDelivery=0;
    }
    update();

  }
  chooseShippingAddress(int val){
    addressId = val;
    update();

  }
  List<AddressModel> address=[];
  getAllAddress() async{
    var response=await addressData.getAllData(myServices.sharedPreferences.getString(userId)!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response["status"]=="success"){
        address.clear();
        List addresses=response["data"];
        address.addAll(addresses.map((e)=>AddressModel.fromJson(e)));
        print("sucessfully get address");
      }
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  addOrders() async{
    statusRequest=StatusRequest.loading;

    Map data={
      'userid':myServices.sharedPreferences.getString(userId),
      'addressid':addressId.toString()??'0',
      'ordertype':deliveryType.toString(),
      'orderdelivery':orderDelivery.toString(),
      'orderprice':priceOrder.toString(),
      'ordercoupon':couponId.toString(),
      'orderpaymethod':paymentMethod.toString(),
      'coupondiscount':'10'.toString(),
    };
    var response=await checkoutData.addOrder(data);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response["status"]=="success"){
        add_removeSnack('order complete');
        Timer(Duration(seconds: 3),(){
          Get.offAllNamed('home');

        });
       // Delay(Duration(seconds: 3),
        print("sucessfully complet checout");
      }
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getAllAddress();
    super.onInit();
    couponId=Get.arguments['couponId'];
    priceOrder=Get.arguments['priceOrder'];
  }
  void checkout(){
    if(deliveryType==null||paymentMethod==null){
      add_removeSnack('checkout data',icon:Icons.error_outline,iconColor: Colors.red);
    }
    else if(deliveryType == 'home delivery'&&address.isEmpty){
      add_removeSnack('pls enter address',icon:Icons.add_alert_outlined,iconColor: Colors.red);
    }
    else{
      addOrders();

    }
    update();
  }
  goToAddressPage(){
    Get.toNamed('/addressView',arguments: {
      'source':'from checkout',
    });
  }

}