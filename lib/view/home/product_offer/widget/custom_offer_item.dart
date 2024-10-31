import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/offers_items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../controller/fav_controller.dart';
import '../../../../controller/items_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../core/shared/app_style.dart';
import '../../../../data/data_source/model/items_model.dart';
import '../../../../generated/assets.dart';

class ItemsOfferCard extends GetView<OffersItemsController> {
  const ItemsOfferCard({super.key, required this.item});
  final ItemsModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTodetailsPage(item);
      },
      child: Card(
        elevation: 5,
        child: Stack(
          children: [
            Padding(
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
                        '${item.itemsPriceDiscount} \$',
                        style: textStyle.Bold20,
                      ),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[item.itemsId] ==
                                    1) {
                                  controller.setFavorite(
                                      item.itemsId, 0);
                                  controller.removeFromFav(item.itemsId!.toString());
                                } else {
                                  controller.setFavorite(
                                      item.itemsId, 1);
                                  controller.addToFav(item.itemsId!.toString());

                                }
                              },
                              icon: Icon(
                                controller.isFavorite[item.itemsId] == 1
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: Colors.red,
                              )))

                    ],
                  ),
                ],
              ),
            ),
            if(item.itemsDiscount!=0)
              Positioned(right: 0,
                  child: Image.asset(Assets.images001Sale,width: 50,)),
          ],
        ),
      ),
    );
  }
}
