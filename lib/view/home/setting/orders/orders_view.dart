import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_outlined,color:Colors.white,size: 30,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
              child: Card(
                child: ListTile(
                  title: Center(child: Text('pending orders'.tr,style: textStyle.Bold20.copyWith(color: AppColors.secondaryColor),)),
                  trailing: Icon(Icons.shopping_cart_checkout_outlined,color: AppColors.thirdColor,size: 30,),
                  onTap: () {
                    Get.toNamed('/pendingorders');
                    // Navigate to OrderDetailsView with order details
                  },
                ),
              ),
            ),
          const SizedBox(height: 50,),
            SizedBox(
              height: 90,
              child: Card(
                child: ListTile(
                  title: Center(child: Text('order archive'.tr,style: textStyle.Bold20.copyWith(color: AppColors.secondaryColor),)),
                  trailing: Icon(Icons.archive_outlined,color: AppColors.thirdColor,size: 30,),
                  onTap: () {
                    Get.toNamed('/archivedorders');

                    // Navigate to OrderDetailsView with order details
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
