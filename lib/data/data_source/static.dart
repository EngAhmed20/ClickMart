import 'package:ecommerce_app/generated/assets.dart';
import 'package:get/get.dart';

import 'model/onboarding_model.dart';

List<onBoardingModel> onBordingList = [
  onBoardingModel(
      title: 'bordingtitle1'.tr,
      body:
          'bordingbody1'.tr,
      image: Assets.imagesOnboardingone),
  onBoardingModel(
      title: 'bordingtitle2'.tr,
      body: 'bordingbody2'.tr,
      image: Assets.imagesOnboardingtwo),
  onBoardingModel(
      title: 'bordingtitle3'.tr,
      body: 'bordingbody3'.tr,
      image: Assets.imagesOnboardingthree),
  onBoardingModel(
      title: 'bordingtitle4'.tr,
      body: 'bordingbody4'.tr,
      image: Assets.imagesOnboardingfour)
];
