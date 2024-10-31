import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/view/home/setting/widget/custom_list_title.dart';
import 'package:ecommerce_app/view/home/setting/widget/lang_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/setting_controller.dart';

class SettingsScr extends StatelessWidget {
  const SettingsScr({super.key});

  @override
  Widget build(BuildContext context) {
   SettingControllerImpl controller= Get.put(SettingControllerImpl());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: Get.width / 2,
                color: AppColors.primaryColor,
              ),
              Positioned(
                top: Get.width / 2.7,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(Assets.imagesAvatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          CustomListTitle(text: 'disNotification'.tr,onTap: (){},trailing: Switch(onChanged: (value){}, value: true,),),
          CustomListTitle(text: 'address'.tr, icon: Icons.location_on_outlined,onTap: (){    Get.toNamed('/addressView',arguments: {
            'source':'from setting',
          });
          ;}),
          CustomListTitle(text: 'orders'.tr, icon: Icons.shopping_cart_checkout_outlined,onTap: (){Get.toNamed('/ordersview');}),
          DropDownLang(),
          CustomListTitle(text: 'about'.tr, icon: Icons.help_outline_rounded,onTap: (){}),
          CustomListTitle(text: 'contact'.tr, icon: Icons.contact_mail_outlined,onTap: ()async{

            await launchUrl(Uri.parse("tel:01158364739"));
          }),
         CustomListTitle(text: 'logout'.tr, icon: Icons.logout_outlined,onTap: (){
           Get.defaultDialog(
             title: 'alert'.tr,titleStyle: textStyle.semiBold18.copyWith(color: AppColors.secondaryColor),
             middleText: 'logout msg'.tr,middleTextStyle: textStyle.semiBold16,
             onCancel: (){
             },
             textCancel: 'cancle'.tr,
             textConfirm: 'confirm'.tr,
             buttonColor: Colors.red,

             onConfirm: (){
               controller.logout();
             },

           );
            }),





        ],
      ),
    );
  }
}

