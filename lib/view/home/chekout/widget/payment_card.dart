import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key, required this.text, required this.isActive, this.onTap});
  final String text;
  final bool isActive;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.all(12),
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: isActive?AppColors.secondaryColor:AppColors.thirdColor,
        ),
        child: Text('${text}'.tr,style: textStyle.semiBold20.copyWith(color:isActive? Colors.white:Colors.black),),
      ),
    );
  }
}
