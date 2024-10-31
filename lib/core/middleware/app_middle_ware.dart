import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constant/app_string.dart';

class AppMiddleWare extends GetMiddleware{
//int get priority=>1;
MyServices myServices=Get.find();
@override
  RouteSettings?redirect(String?route)
{
  if(myServices.sharedPreferences.getBool('home')==true){
    return const  RouteSettings(name: '/home');

  }
  if(myServices.sharedPreferences.getString(boardingShow) != null)
    {
      return const  RouteSettings(name: '/login');
    }
}
}