import 'dart:ui';

import 'package:ecommerce_app/core/functions/firebase_message.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_theme.dart';

class LocalController extends GetxController {
  MyServices myServices=Get.find();
   Locale? initLang;
   ThemeData appTheme=themeEnglish;
  List<String>language=<String>[];
  changeLocal(String langCode) {
    Locale locale=Locale(langCode);
    appTheme=langCode=='en'?themeEnglish:themeArabic;
    myServices.sharedPreferences.setString('lang', langCode);
    Get.updateLocale(locale);
    Get.offNamed('/onboarding');
  }
  changeLangInsideApp(String appLang){
    if(appLang=='en'.tr){
      Locale locale=Locale('en');
      language=<String>['ar'];
      myServices.sharedPreferences.setString('lang','en');
      Get.updateLocale(locale);
    }else{
      Locale locale=Locale('ar');
      myServices.sharedPreferences.setString('lang','ar');
      language=<String>['en'];
      Get.updateLocale(locale);
    }
    update();

  }


  reverseLocal() {
    late  String newLang ;

    if(myServices.sharedPreferences.getString('lang')=='en')
     {
       newLang="ar";
     }
   else{
     newLang="en";
   }
    changeLocal(newLang);
  }
  @override
  void onInit() {
    firebaseMessage();
    requestNotificationPermission();
    if(myServices.sharedPreferences.getString('lang')=='ar'){
      initLang=Locale('ar');
      appTheme=themeArabic;
    }
    else if(myServices.sharedPreferences.getString('lang')=='en'){
      initLang=Locale('en');
      appTheme=themeEnglish;
    }
    else{
      initLang=Get.deviceLocale;
      appTheme=themeEnglish;
    }
    if(initLang== Locale('ar')){
      language=<String>['en'];

    }else{
      language=<String>['ar'];


    }
  }
}