import 'package:ecommerce_app/data/data_source/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_string.dart';
import '../core/services/services.dart';

abstract class OnboardingController extends GetxController{
  late PageController pageController;
  MyServices myServices=Get.find();

  next();
  onPageChange(int index);
}
class OnBoardingControllerImp extends OnboardingController{
  int currentPage=0;
  @override
  next() {
    currentPage++;

    if(currentPage<onBordingList.length)
      {
        pageController.animateToPage(currentPage, duration: Duration(milliseconds: 600), curve: Curves.easeOut);
      }
    else{
      myServices.sharedPreferences.setString(boardingShow, 'skip');
      Get.offAllNamed('/login',);
    }

  }

  @override
  onPageChange(int index) {
    currentPage=index;
    update();
  }
  @override
  void onInit() {
    pageController=PageController();
  }

}