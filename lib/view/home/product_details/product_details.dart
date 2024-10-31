import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/controller/product_details_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/home/product_details/widget/item_color.dart';
import 'package:ecommerce_app/view/home/product_details/widget/item_details_stack.dart';
import 'package:ecommerce_app/view/home/product_details/widget/price_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImpl controller=Get.put(ProductDetailsControllerImpl());
    return Scaffold(
      bottomNavigationBar:Container(
        height: 60,
        margin: EdgeInsets.all(5),
        child: MaterialButton(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          padding: EdgeInsets.zero,
          onPressed: (){
           controller.goToCart();
          },color: AppColors.primaryColor,child:  Text('go to cart'.tr,style: textStyle.Bold24,),),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<ProductDetailsControllerImpl>(
        builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget:Container(
          child: ListView(
            children: [
              ItemDetailsStack(),
              const SizedBox(height: 90,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(translateDataBase(controller.item.itemsNameAr,controller.item.itemsName),style: textStyle.Bold28.copyWith(color: AppColors.secondaryColor),),
                      const SizedBox(height: 10,),
                      PriceAndCount(price: controller.item.itemsPriceDiscount!,
                        priceBefDis: controller.item.itemsPrice!,
                        count: controller.quantity,
                        onAdd: (){controller.incItemQuantity();},onRemove: (){controller.decItemQuantity();},disount: controller.item.itemsDiscount!,),
                      const SizedBox(height: 10,),
                      Text(translateDataBase(controller.item.itemsDescAr,controller.item.itemsDesc),style: textStyle.semiBold20.copyWith(color:Colors.grey[700]),),
                      const SizedBox(height: 10,),
                      Text('delivery time'.tr,style: textStyle.Bold28,),
                      Row(
                        children: [
                           Icon(Icons.timer_sharp,size: 30,color: AppColors.primaryColor,),
                          const SizedBox(width:10,),
                          Text(controller.deliveryTime??'1-2 ',style: textStyle.semiBold20,),
                          const SizedBox(width: 2,),
                          Text('day'.tr,style: textStyle.semiBold20,),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text('color'.tr,style: textStyle.Bold28,),
                      /* Container(
                   height: 80,
                   width: 330,
                   decoration: BoxDecoration(
                     color: Colors.grey[300],
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Row(
                     children: [
                       ...List.generate(controller.itemColor.length,(index)=> InkWell(
                         splashColor: Colors.grey,
                         onTap: (){
                           print(controller.itemColor[index]);
                         },
                         child: Container(
                           margin: EdgeInsets.all(10),
                           height: 60,
                           width: 60,
                           decoration: BoxDecoration(
                             color: controller.itemColor[index],
                             borderRadius: BorderRadius.circular(10)
                           ),
                         ),
                       )),
                     ],
                   ),
                 )*/
                      ItemColor(),

                    ],
                  ),
              )

            ],
          ),
        ),),

      )

    );
  }
}
