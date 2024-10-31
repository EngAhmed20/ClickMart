import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/controller/order/order_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
requestNotificationPermission()async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
firebaseMessage(){
  FirebaseMessaging.onMessage.listen((message){
    if (kDebugMode) {
      print("=====================notification================");
      print("title: ${message.notification?.title??''}");
      print("Message: ${message.notification?.body?? ''}");
    }
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!,message.notification!.body!);
    refreshNotificationPage();
    refreshPage(message.data);



  });

}
refreshPage(data){

  if(Get.currentRoute=="/pendingorders" ||data['pagename']=="refreshorderpending") {
    OrderController controller = Get.find();
    controller.refreshPage();
  }
}
refreshNotificationPage(){
  print('update notification');
    NotificationController controller=Get.put(NotificationController());
    controller.refreshPage();

}