import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:flutter/material.dart';

class LangButton extends StatelessWidget {
   LangButton({super.key,required this.onPressed,required this.text});
  void Function()? onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:onPressed,
      child: Text(text,style: textStyle.semiBold20,),
    );
  }
}
