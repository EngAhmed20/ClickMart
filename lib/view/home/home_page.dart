import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/home/widget/app_bar.dart';
import 'package:ecommerce_app/view/home/widget/card_home.dart';
import 'package:ecommerce_app/view/home/widget/list_categories.dart';
import 'package:ecommerce_app/view/home/widget/list_items_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/functions/translate_database.dart';
import '../../data/data_source/model/items_model.dart';
import '../../generated/assets.dart';
import 'items/widget/items_card.dart';
import 'items/widget/list_search.dart';
import 'widget/text_home.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());

    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAppBar(
                titleAppBar: 'search'.tr,
                onChanged: (value) {
                  controller.checkSearch(value);
                },
                controller: controller.searchController,
                onPressedSearch: () {
                  controller.onSearchItem();
                },
                onPressedFavIcon: () {
                  Get.toNamed('/fav');
                },
              ),
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                failureText: Text(
                  'no item search'.tr,
                  style: textStyle.Bold20,
                ),
                faiTextAlign: Alignment.topCenter,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           CustomCardHome(model: controller.homeText,),
                          CustomText(text: 'categories'.tr),
                          const SizedBox(
                            height: 10,
                          ),
                          ListCategoriesHome(),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(text: 'topselling'.tr),
                          const SizedBox(height: 10),
                          ListItemsHome(),
                        ],
                      )
                    : ListSearch(
                        item: controller.searchData,
                      ))
          ],
        ),
      ),
    );
  }
}

