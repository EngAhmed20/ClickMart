import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class NotificationData{
  Crud crud;
  NotificationData(this.crud);
  getdata(String userid)async{
    var response=await crud.postData(AppLinks.notificationLink, {
      'userid':userid
    });
    return response.fold((l)=>l,(r)=>r);

  }
  deleteNotification(String notificationId)async{
    var response=await crud.postData(AppLinks.deleteNotification,{
      'notificationid':notificationId,
    });
    return response.fold((l)=>l,(r)=>r);

  }
}