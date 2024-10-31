import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../core/shared/app_style.dart';
import '../../../../data/data_source/model/items_model.dart';

class ListSearch extends GetView<HomeControllerImpl> {
  const ListSearch({super.key, required this.item});
  final List<ItemsModel> item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: item.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: (){
              controller.goTodetailsPage(item[index]);

            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                          imageUrl:"${AppLinks.itemsImgLink}${item[index].itemsImage}",)),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          translateDataBase(
                              item[index].itemsNameAr!, item[index].itemsName!),
                          style: textStyle.semiBold20,
                        ),
                        subtitle: Text(
                          '${item[index].itemsPrice} \$',
                          style: textStyle.Bold20.copyWith(
                              color: AppColors.secondaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
