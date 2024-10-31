import 'package:ecommerce_app/controller/root_home_controller.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/home/widget/app_bar.dart';
import 'package:ecommerce_app/view/home/widget/bottom_app_bar.dart';
import 'package:ecommerce_app/view/home/widget/text_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootHome extends StatelessWidget {
  const RootHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RootHomeControllerImpl());
    return GetBuilder<RootHomeControllerImpl>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  Get.toNamed('/cart');
                },
                child: const Icon(Icons.shopping_cart),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Container(
                height: 77,
                padding: EdgeInsets.zero,
                child: BottomAppBar(
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  shape: CircularNotchedRectangle(),
                  notchMargin: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        controller.listPage.length,
                        ((index) => CustomBottomAppBar(
                            onPressed: () {
                              controller.changePage(index);
                            },
                            icon: controller.iconBottomAppbar[index],
                            index:index,
                            text: controller.titleBottomAppbar[index],
                            active:
                                controller.currentPage == index ? true : false)),
                      ),
                    ],
                  ),
                ),
              ),
              body: controller.listPage[controller.currentPage],
            ));
  }
}
