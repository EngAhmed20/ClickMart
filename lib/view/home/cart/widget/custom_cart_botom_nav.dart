import 'package:ecommerce_app/view/auth/login/widget/custom_textform.dart';
import 'package:ecommerce_app/view/home/cart/widget/custom_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';
import '../../../auth/login/widget/custom_button.dart';

class CustomCartBotomNav extends StatelessWidget {
  const CustomCartBotomNav(
      {super.key,
      required this.itemsPrice,
      required this.totalCost,
      required this.completeCheckFun,
      required this.couponController,
      required this.applyCouponFun,
      required this.itemsDiscount, required this.couponName});
  final String itemsPrice;
  final String totalCost;
  final String couponName;
  final String itemsDiscount;
  final TextEditingController couponController;
  final void Function() completeCheckFun;
  final void Function() applyCouponFun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          couponName=='null'?Row(
            children: [
              Expanded(
                flex: 6,
                child: CustomTextForm(
                  label: '',
                  controller: couponController,
                  hint: 'enter coupon'.tr,
                  valid: (String? val) {},
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 2,
                  child: CustomButton(
                    text: 'apply'.tr,
                    onPressed: applyCouponFun,
                  )),
            ],
          ):Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('coupon code'.tr,style: textStyle.semiBold16,),
              const SizedBox(width: 10,),
              Text('${couponName}',style: textStyle.Bold20.copyWith(color: AppColors.primaryColor),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor, width: 1.5)),
            child: Column(
              children: [
                CustomPrice(
                  text: 'price'.tr,
                  price: itemsPrice,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomDiscountPrice(
                  text: 'discount'.tr,
                  price: itemsDiscount,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomPrice(
                  text: 'total'.tr,
                  price: totalCost,
                  style:
                      textStyle.Bold22.copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
              text: 'checkout'.tr,
              textStyle: textStyle.Bold20.copyWith(color: Colors.white),
              onPressed: completeCheckFun),
        ],
      ),
    );
  }
}
