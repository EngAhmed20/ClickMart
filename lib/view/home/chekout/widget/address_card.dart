import 'package:flutter/material.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class CheckoutAddressCard extends StatelessWidget {
  const CheckoutAddressCard({super.key, required this.isActive, required this.text, required this.subText, this.onTap});
  final bool isActive;
  final String text;
  final String subText;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return             InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(left: 10,bottom: 15),
        color: isActive?AppColors.secondaryColor:null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            text,
            style: textStyle.semiBold20.copyWith(color: isActive?Colors.white:null),
          ),
          subtitle: Text(
            subText,
            style: textStyle.regular18.copyWith(color: isActive?Colors.white:null),
          ),
        ),
      ),
    )
    ;
  }
}
