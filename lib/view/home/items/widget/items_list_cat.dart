import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../core/shared/app_style.dart';
import '../../../../data/data_source/model/categories_model.dart';

class ItemsListCat extends GetView<ItemsControllerImpl> {
  const ItemsListCat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesItems(categoriesModel: CategoriesModel.fromJson(controller.categories[index]),selectedCat:index);

          }),
    );

  }
}
class CategoriesItems extends GetView<ItemsControllerImpl> {
  const CategoriesItems( {super.key, required this.categoriesModel,required this.selectedCat});
  final CategoriesModel categoriesModel;
  final int selectedCat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.changeSelectedCat(selectedCat,categoriesModel.categoriesId.toString());
      },
      child: GetBuilder<ItemsControllerImpl>(
        builder: (controller)=>Container(
          padding: EdgeInsets.only(left: 5,right: 5),
          decoration:controller.selectedCat==selectedCat? BoxDecoration(
              border:Border(
                  bottom: BorderSide(width: 3,color: AppColors.primaryColor)
              )
          ):null,
          child: Text(
    translateDataBase(categoriesModel.categoriesNameAr!, categoriesModel.categoriesName!),
              style: textStyle.Bold20.copyWith(
                  color: Colors.grey[700])),
        ),
      )

    );
  }
}
