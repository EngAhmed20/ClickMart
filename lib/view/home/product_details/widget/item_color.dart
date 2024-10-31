import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/product_details_controller.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class ItemColor extends GetView<ProductDetailsControllerImpl> {
  const ItemColor({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      ...List.generate(controller.itemColor.length, (index)=> InkWell(
        onTap: (){controller.changeColor(index);},
        child: Container(
          height: 60,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10),
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
            color:controller.itemColor[index]['active']== true? AppColors.primaryColor:Colors.white,
          ),
          child: Text('${controller.itemColor[index]['name']}',style: textStyle.semiBold18,),
        ),
      ),)
    ],);

  }
}
