import 'package:ecommerce_app/controller/order/order_controller.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../generated/assets.dart';

void showDialogRating(BuildContext context ,String orderId){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'rating title'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'rating body'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(Assets.imagesLogo,height: 100,),
      submitButtonText: 'submit'.tr,
      submitButtonTextStyle: textStyle.semiBold18.copyWith(color: AppColors.primaryColor),
      commentHint: 'rating hint'.tr,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrderController controller=Get.find();
        controller.rateArchivedOrder(orderId, response.rating.toString(),response.comment);
        print('rating: ${response.rating}, comment: ${response.comment}');
      },
    ),
  );
}

// show the dialog
