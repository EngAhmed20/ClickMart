import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/data_source/model/home_string_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';
import '../../../generated/assets.dart';

class CustomCardHome extends StatelessWidget {
  const CustomCardHome({super.key, this.model,});
  final HomeStringModel? model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 15),
          height: 180,
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(translateDataBase(model?.textTitleAr, model?.textTitleEn)??
              'summeroffer'.tr,
              style: textStyle.Bold28.copyWith(
                  color: Colors.white),
            ),
            subtitle: Text(translateDataBase(model?.textBodyAr, model?.textBodyEn)??
              'cashback'.tr,
              style: textStyle.Bold24.copyWith(
                  color: Colors.white),
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 5,
            child: Lottie.asset(Assets.imagesCash,
                width: 100, repeat: false))
      ],
    )
    ;
  }
}
