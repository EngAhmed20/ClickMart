import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/data_source/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/api_link.dart';
import '../../../core/shared/app_style.dart';

class ListItemsHome extends GetView<HomeControllerImpl> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: controller.items.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            Item(item: ItemsModel.fromJson(controller.items[index]),)
      ),
    );
  }
}
class Item extends GetView<HomeControllerImpl> {
  const Item({super.key, required this.item,});
  final ItemsModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        controller.goTodetailsPage(item);
      },
      child: Container(
         padding:const EdgeInsets.only(right:10),
        child: Stack(
          children: [
            Image.network("${AppLinks.itemsImgLink}${item.itemsImage}",height: 140,width: 140),
            Positioned(child:Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
            ) ),
            Positioned(bottom: 0,left: 50, child: Text(translateDataBase(item.itemsNameAr!, item.itemsName!),style: textStyle.Bold19.copyWith(color: Colors.white),))

          ],
        ),
      ),
    );
  }
}
