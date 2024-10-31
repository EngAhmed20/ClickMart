import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/data_source/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/api_link.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class ListCategoriesHome extends GetView<HomeControllerImpl> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesItems(categoriesModel: CategoriesModel.fromJson(controller.categories[index]),selectedCat:index);

          }),
    );

  }
}
class CategoriesItems extends GetView<HomeControllerImpl> {
  const CategoriesItems( {super.key, required this.categoriesModel,required this.selectedCat});
  final CategoriesModel categoriesModel;
  final int selectedCat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItemsPage(controller.categories,selectedCat,categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius:
                  BorderRadius.circular(10)),
              child: SvgPicture.network(
                  "${AppLinks.catImgLink}${categoriesModel.categoriesImage}",
                  height: 60,
                  width: 60,
                  color: Colors.white)),
          Text(
              translateDataBase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!),
              style: textStyle.Bold16.copyWith(
                  color: AppColors.secondaryColor)),
        ],
      ),
    );
  }
}

