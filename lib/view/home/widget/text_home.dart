import 'package:flutter/material.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key,required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle.Bold20.copyWith(
          color: AppColors.secondaryColor),
    );
  }
}
