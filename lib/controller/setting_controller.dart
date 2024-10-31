import 'package:ecommerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../core/constant/app_string.dart';

abstract class SettingController extends GetxController{
  logout();

}
class SettingControllerImpl extends SettingController{
  MyServices myServices=Get.find();
  @override
  logout() {
    String userNotification=myServices.sharedPreferences.getString(userId)!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userNotification}");
    myServices.sharedPreferences.setBool('home', false);
    Get.offNamed('/login');
  }

}