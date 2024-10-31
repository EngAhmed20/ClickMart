import 'package:flutter/material.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class CustomPrice extends StatelessWidget {
   CustomPrice({super.key, required this.text, required this.price, this.color,this.style});
  final String text;
  final String price;
   Color? color=Colors.black;
   TextStyle?style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: textStyle.semiBold20.copyWith(color: Colors.grey[500]),),
          const SizedBox(width: 8.0,),
          Text('${price}\$', style: style?? textStyle.semiBold20.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
class CustomDiscountPrice extends StatelessWidget {
  CustomDiscountPrice({super.key, required this.text, required this.price, this.color,this.style});
  final String text;
  final String price;
  Color? color=Colors.black;
  TextStyle?style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: textStyle.semiBold20.copyWith(color: Colors.grey[500]),),
          const SizedBox(width: 8.0,),
          Text('${price}\%', style: style?? textStyle.semiBold20.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
