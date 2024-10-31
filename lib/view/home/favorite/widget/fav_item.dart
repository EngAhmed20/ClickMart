import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/data/data_source/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../controller/fav_controller.dart';
import '../../../../controller/items_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../core/shared/app_style.dart';

class FavItem extends StatelessWidget {
  const FavItem({super.key, required this.item});
  final FavoriteModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goTodetailsPage(item);
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                  tag: "${item.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: "${AppLinks.itemsImgLink}${item.itemsImage}",
                    height: 180,
                  )),
              const SizedBox(
                height: 6,
              ),
              Text(
                translateDataBase(item.itemsNameAr!, item.itemsName!),
                style: textStyle.semiBold18,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                      item.itemsRating!,
                          (index) => Icon(
                        Icons.star,
                        size: 19,
                        color: Colors.orange,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item.itemsPrice} \$',
                    style: textStyle.Bold20,
                  ),
                  GetBuilder<FavoriteController>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                              controller.removeFromFav(item.itemsId!.toString());
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.red,
                          )))

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
