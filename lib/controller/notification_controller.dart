import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/remote/notification_data.dart';
import 'package:get/get.dart';

import '../data/data_source/model/notification_model.dart';

class NotificationController extends GetxController{
  int notificationNumber=0;
  StatusRequest statusRequest=StatusRequest.none;
  NotificationData notificationData=NotificationData(Get.find());
  List <NotificationModel> notifications=[];
  MyServices myServices=Get.find();
  getNotification()async{
    notifications.clear();
    statusRequest =StatusRequest.loading;
    var response=await notificationData.getdata(myServices.sharedPreferences.getString(userId)!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listData=response['data'];
        notifications.addAll(listData.map((e)=>NotificationModel.fromJson(e)));
        updateNotification();
        print("sucessfully get data");
        print(statusRequest);
      }else{
       print("no notifications ");
        statusRequest=StatusRequest.failure;
        print(statusRequest);
      }
    }
    else{
      print("error in get data last");
      print(statusRequest);
    }
    update();

  }
  deleteNotification(String notificationId)async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData.deleteNotification(notificationId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getNotification();
      }
      else {

      }
    }
    update();

  }
  updateNotification(){
    notificationNumber=notifications.length??0;
    update();
  }
  @override
  void onInit() async{
    await getNotification();
    updateNotification();
  }
  refreshPage()async{
    await getNotification();
    update();
  }
}