import 'package:ecommerce_app/binding.dart';
import 'package:ecommerce_app/core/localization/change_local.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constant/app_routes.dart';
import 'core/functions/get_access_token.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CallServices();
NotificationsHelper notificationsHelper= NotificationsHelper();
  await notificationsHelper.initNotifications();
  await notificationsHelper.getAccessToken();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController localController=Get.put(LocalController());
    MyServices myServices=Get.find();
    //String? onbordingShown=myServices.sharedPreferences.getString(Skip);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: localController.appTheme,
      debugShowCheckedModeBanner: false,
     // routes: pageRoutes,
      getPages: pageRoutes,
      translations: MyTranslation(),
      //initialRoute:onbordingShown!=null?'/login':'/',
      locale: localController.initLang,
      initialBinding: MyBinding(),
    );
  }
}

