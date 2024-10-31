import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/product_details_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_string.dart';

class ItemDetailsStack extends GetView<ProductDetailsControllerImpl> {
  const ItemDetailsStack({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(40),
                bottomRight: Radius.circular(40),
              )
          ),
        ),
        Positioned(top: 50,
            right: Get.width/5,
            left: Get.width/5,
            child: Hero(
                tag:"${ controller.item.itemsId}",
                child: CachedNetworkImage(imageUrl:"${AppLinks.itemsImgLink}${controller.item.itemsImage}",))),


      ],
    );

  }
}
