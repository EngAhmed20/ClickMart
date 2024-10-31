import 'package:ecommerce_app/controller/fav_controller.dart';
import 'package:ecommerce_app/controller/offers_items_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/home/product_offer/widget/custom_offer_item.dart';
import 'package:ecommerce_app/view/home/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';
import '../items/widget/list_search.dart';

class OfferProducts extends StatelessWidget {
  const OfferProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OffersItemsController());
    Get.put(FavoriteController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'offer product'.tr,
            style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<OffersItemsController>(
            builder: (controller) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      CustomAppBar(
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
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          faiTextAlign: Alignment.topCenter,
                          failureText: Text(
                            'no offer'.tr,
                            style: textStyle.Bold20,
                          ),
                          widget: !controller.isSearch? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: .6),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ItemsOfferCard(
                              item: controller.data[index],
                            ),
                            itemCount: controller.data.length,
                          ): ListSearch(
                            item: controller.searchData,
                          )),
                    ],
                  ),
                )));
  }
}
