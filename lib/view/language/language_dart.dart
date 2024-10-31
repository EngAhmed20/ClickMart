import 'package:ecommerce_app/core/localization/change_local.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/language/widget/choose_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangView extends StatelessWidget {
  const LangView({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController localController=Get.find();

    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('chooseLang'.tr,style:textStyle.Bold23,),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             LangButton(onPressed: (){
               localController.changeLocal('ar');
             },text: 'ar'.tr,),
             LangButton(onPressed: (){
               localController.changeLocal('en');
             }, text: 'en'.tr)
            ],
          ),
        ],
      ),
    );
  }
}
