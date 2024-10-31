import 'package:ecommerce_app/controller/address_controller.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/auth/login/widget/custom_button.dart';
import 'package:ecommerce_app/view/auth/login/widget/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/valid_input.dart';

class AddAddress extends StatelessWidget {
   AddAddress({super.key});

AddressControllerImpl controller=Get.find();
   GlobalKey <FormState>key=GlobalKey();
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16,
        bottom: MediaQuery
            .of(context)
            .viewInsets
            .bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: key,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              Text('add new address'.tr,style: textStyle.semiBold20,),
              const SizedBox(height: 5,),
              CustomTextForm(label: 'city'.tr, suffixIcon: Icons.location_on_outlined, controller: controller.city!, hint:'city hint'.tr, valid: (String?val){
                return validInput(val!,3,50,"city");

              },keyboardType: TextInputType.text,),
              const SizedBox(height: 15,),
              CustomTextForm(label: 'street'.tr, suffixIcon: Icons.location_city, controller: controller.street!, hint:'street hint'.tr, valid: (String?val){
                return validInput(val!,3,50,"street");

              },keyboardType: TextInputType.text,),
              const SizedBox(height: 15,),
              CustomTextForm(label: 'address classification'.tr, suffixIcon: Icons.home_outlined, controller: controller.name!, hint:'add class hint'.tr, valid: (String?val){
                return validInput(val!,3,25,"name");

              },keyboardType: TextInputType.text,),
              const SizedBox(height: 15,),
              const SizedBox(height: 20,),
              CustomButton(text: 'add address'.tr, onPressed: ()async{
                if(key.currentState!.validate()){
                  await controller.addAddress();
                }
              },textStyle: textStyle.semiBold20.copyWith(color: Colors.white),),




            ],
          ),
        ),
      ),

    );
  }

}
