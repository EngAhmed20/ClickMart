import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/address_model.dart';
import 'package:ecommerce_app/data/data_source/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/add_remove_cart_snackbar.dart';

abstract class AddressController extends GetxController{
  addAddress();
  deleteAddress(String addressId);
  updateAddress(String addressId);
  getAllAddress();

}
class AddressControllerImpl extends AddressController{
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;
  TextEditingController? cityEdit;
  TextEditingController? streetEdit;
  TextEditingController? nameEdit;
  String? refreshCheckoutAddress;
  MyServices myServices=Get.find();
  StatusRequest statusRequest=StatusRequest.none;
  AddressData addressData=AddressData(Get.find());


  @override
  void onInit() {
    city=TextEditingController();
    street=TextEditingController();
    name=TextEditingController();
    cityEdit=TextEditingController();
    streetEdit=TextEditingController();
    nameEdit=TextEditingController();
    getAllAddress();
    refreshCheckoutAddress=Get.arguments['source'];
    super.onInit();
  }

  @override
  addAddress() async{
   var response=await addressData.addData(myServices.sharedPreferences.getString(userId)!, city!.text, name!.text, street!.text);
   statusRequest=handlingData(response);
   if(StatusRequest.success==statusRequest){
     if(response["status"]=="success"){
       Get.back();
       clearAddress();
       add_removeSnack('add address msg'.tr);
       refreshCheckoutControllerAddress();

     }
   }else{
     statusRequest=StatusRequest.failure;
   }
   getAllAddress();
   update();
  }
  refreshCheckoutControllerAddress(){
    if(refreshCheckoutAddress=='from checkout')
      {
        CheckoutController controller=Get.find();
        controller.getAllAddress();
        print('refreshCheckout');

      }

  }

  @override
  deleteAddress(addressId) async{
    var response=await addressData.deleteData(addressId);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response["status"]=="success"){
        getAllAddress();
        add_removeSnack('delete address msg'.tr);


      }
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }
  List<AddressModel>addressModel=[];
  @override
  getAllAddress() async{
    var response=await addressData.getAllData(myServices.sharedPreferences.getString(userId)!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response["status"]=="success"){
        addressModel.clear();
        List addresses=response["data"];
        addressModel.addAll(addresses.map((e)=>AddressModel.fromJson(e)));
        print(addressModel[0].addressLat);
      }
    }else{
      statusRequest=StatusRequest.failure;
    }
    update();
  }

  @override
  updateAddress(addressId) async{
    var response=await addressData.updateData( addressId,cityEdit!.text, nameEdit!.text, streetEdit!.text);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response["status"]=="success"){
        Get.back();
        clearAddress();
        add_removeSnack('edit address msg'.tr);

      }
    }else{
      statusRequest=StatusRequest.failure;
    }
    getAllAddress();
    update();
  }
  clearAddress() {
    city!.clear();
    street!.clear();
    name!.clear();
  }




}