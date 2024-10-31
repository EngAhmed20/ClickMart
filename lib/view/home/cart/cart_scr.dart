import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/home/cart/widget/cart_list_view_item.dart';
import 'package:ecommerce_app/view/home/cart/widget/custom_cart_botom_nav.dart';
import 'package:ecommerce_app/view/home/cart/widget/items_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScr extends StatelessWidget {
  const CartScr({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImpl controller=Get.put(CartControllerImpl());
    return  GetBuilder<CartControllerImpl>(
        builder: (CartControllerImpl controller) => Scaffold(
          body: HandlingDataView(
          statusRequest: controller.getData,
          widget:Scaffold(
          bottomNavigationBar: CustomCartBotomNav(
            itemsPrice: "${controller.totalItemsPrice}",
            totalCost: "${controller.totalCost}",
            couponController: controller.couponController!,
            completeCheckFun: () {controller.goToCheckout();},
            applyCouponFun: (){controller.applyCoupon();},
            itemsDiscount:"${controller.discount}",
            couponName: controller.couponName??'null',
          ),
          body:Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Text(
                      'cart'.tr,
                      style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),
                    itemsCount(
                      items: controller.totalItemsCount,
                    ),
                    const SizedBox(height: 10.0),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index) => ListViewItem(
                        itemImg: "${AppLinks.itemsImgLink}${controller.data[index].itemsImage}",
                        itemTitle: translateDataBase('${controller.data[index].itemsNameAr}', '${controller.data[index].itemsName}'),
                        itemPrice: '${controller.data[index].itemsprice}',
                        itemCount: '${controller.data[index].countitems}',
                        addItem: () async{await controller.addToCart(controller.data[index].itemsId.toString());},
                        removeItem: () async{
                          await controller.removeFromCart(controller.data[index].itemsId.toString());
                        },
                      ),
                      itemCount: controller.data.length,
                    )
                  ],
                ),
              ),
            ),
            failureText: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('empty cart'.tr,style: textStyle.semiBold20,textAlign: TextAlign.center,),),
            ),
          ),
        ));
  }
}
