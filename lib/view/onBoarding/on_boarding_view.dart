import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/view/onBoarding/widget/onbording_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child:OnbordingBody(),
      ),
    );
  }
}
