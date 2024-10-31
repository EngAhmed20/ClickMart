import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';
import '../../../../generated/assets.dart';

class DeliveryMethod extends StatelessWidget {
  const DeliveryMethod({super.key, required this.isActive, required this.text, required this.imageName, this.onTap});
  final bool isActive;
  final String text;
  final String imageName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            border: Border.all(),
            color:isActive? AppColors.secondaryColor:null,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageName,height: 100,color:isActive? Colors.white:null,),
            Text('${text}'.tr,style: textStyle.semiBold16.copyWith(color:isActive? Colors.white:null),)
          ],
        ),
      ),
    );
  }
}
