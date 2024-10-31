import 'package:ecommerce_app/controller/fav_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/data/data_source/model/favorite_model.dart';
import 'package:ecommerce_app/view/home/favorite/widget/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavScr extends StatelessWidget {
   FavScr({super.key});
   FavoriteController controller=Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Favorite'.tr),
        centerTitle: true,
      ),
      body:Container(
        child: GetBuilder<FavoriteController>(
          builder: (controller)=>ListView(
            children: [
              HandlingDataView(statusRequest: controller.statusRequest,failureText: Text('Favoritebody'.tr,style: textStyle.semiBold18,          textAlign: TextAlign.center,
              ),widget: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.64),itemCount:controller.favItems.length,
                  itemBuilder: (context,index)=>FavItem(item:FavoriteModel.fromJson(controller.favItems[index]),),),
              ),
            ],
          ),
        ),
      )
    );
  }
}
