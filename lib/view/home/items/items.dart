import 'package:ecommerce_app/controller/fav_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/data/data_source/model/items_model.dart';
import 'package:ecommerce_app/view/home/items/widget/items_card.dart';
import 'package:ecommerce_app/view/home/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/items_list_cat.dart';

class ItemsView extends StatelessWidget {
   ItemsView({super.key});
 final  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImpl());
    FavoriteController favController = Get.put(FavoriteController());
    return Scaffold(
        body: GetBuilder<ItemsControllerImpl>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
           /* CustomAppBar(
              onChanged: (value){},
              controller:searchController,
              titleAppBar: 'search'.tr,
              onPressedSearch: () {},
              onPressedFavIcon: (){Get.toNamed('/fav');},
            ),*/
            const SizedBox(
              height: 20,
            ),
            const ItemsListCat(),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.61),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index){
                favController.isFavorite[controller.items[index]
                ['items_id']] = controller.items[index]['favorite'];
                return  ItemsCard(
                  item: ItemsModel.fromJson(controller.items[index]),
                );
              },
              itemCount: controller.items.length,
            ),
          ],
        ),
      ),
    ));
  }
}
