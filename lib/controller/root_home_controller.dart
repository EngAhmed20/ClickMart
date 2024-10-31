import 'package:ecommerce_app/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/home/notifications/notification_view.dart';
import '../view/home/product_offer/offer_products.dart';
import '../view/home/setting/settings_scr.dart';

abstract class RootHomeController extends GetxController{
  changePage(int index);
}
class RootHomeControllerImpl extends RootHomeController{
  int currentPage=0;
  @override
  changePage(int index) {
    currentPage=index;
    update();
  }
  List<Widget> listPage=[
    HomePage(),
    NotificationsView(),
    OfferProducts(),
    SettingsScr(),

  ];
  List titleBottomAppbar=[
    'home'.tr,
    'notification'.tr,
    'offers product'.tr,
    'settings'.tr,
  ];
  List iconBottomAppbar=[
    Icons.home_outlined,
    Icons.notifications_none_outlined,
    Icons.sell_outlined,
    Icons.settings_outlined,
  ];

}