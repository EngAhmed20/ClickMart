import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends GetView<NotificationController> {
  const CustomBottomAppBar({super.key,required this.onPressed, required this.icon, required this.text, required this.active, required this.index,});
  final void Function()? onPressed;
  final IconData icon;
  final String text;
  final bool? active;
  final int index;


  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return MaterialButton(onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Icon(icon,size: 30,color: active==true?AppColors.primaryColor:Colors.grey[600],),
              if(index==1)
                Transform.translate(offset: Offset(0, -15),
                    child: Text("${controller.notificationNumber}",style: textStyle.Bold24.copyWith(color: AppColors.primaryColor),)),
            ],
          ),
          //Text(text,style: textStyle.Bold16.copyWith(color:active==true?AppColors.primaryColor:Colors.grey[600],fontFamily: "playFair")),

        ],
      ),);
    ;
  }
}
