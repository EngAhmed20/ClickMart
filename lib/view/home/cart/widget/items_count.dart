import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class itemsCount extends StatelessWidget {
   itemsCount({super.key, required this.items});
   int items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryColor,
      ),
      child:Align(
        alignment: Alignment.center,
        child: Text.rich(TextSpan(
          children: [
            TextSpan(
              text: 'itemcount'.tr,
              style: textStyle.semiBold18.copyWith(color: Colors.white),
            ),
            TextSpan(
              text: ' ${items} ',
              style: textStyle.semiBold20.copyWith(color: Colors.white),
            ),
            TextSpan(
              text: 'itemcount2'.tr,
              style: textStyle.semiBold18.copyWith(color: Colors.white) ,
            ),

          ],
        )),
      ),
    )
    ;
  }
}
