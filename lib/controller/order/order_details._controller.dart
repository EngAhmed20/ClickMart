import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/order_model.dart';
import 'package:ecommerce_app/data/data_source/remote/order_details_data.dart';
import 'package:get/get.dart';

import '../../core/constant/app_string.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/data_source/model/order_details_model.dart';

class OrderDetailsController extends GetxController{
  late OrderModel orderModel;
  List<OrderDetailsModel>data=[];
  StatusRequest statusRequest =StatusRequest.none;
  OrderDetailsData orderDetailsData=OrderDetailsData(Get.find());
  MyServices myServices=Get.find();
  getOrderDetails()async{
    data.clear();
    statusRequest=StatusRequest.loading;
    update();

    var response=await orderDetailsData.getData(myServices.sharedPreferences.getString(userId)!,orderModel.ordersId.toString()!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        List listData=response['data'];
        data.addAll(listData.map((e)=>OrderDetailsModel.fromJson(e)));
        print('getOrderDetails');
      }else{
        statusRequest=StatusRequest.failure;

      }

    }else{
      statusRequest=StatusRequest.failure;

    }
    update();


  }


  @override
  void onInit() {
   orderModel=Get.arguments[
     'orderModel'
   ];
   getOrderDetails();
    super.onInit();
  }
}