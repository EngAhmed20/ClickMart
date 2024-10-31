import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/address_controller.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../../core/shared/app_style.dart';
import '../../../auth/login/widget/custom_button.dart';
import '../../../auth/login/widget/custom_textform.dart';

class EditAddress extends StatelessWidget {
   EditAddress({super.key});
   AddressControllerImpl controller=Get.find();
  GlobalKey <FormState>key=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    controller.cityEdit!.text=Get.arguments['city'];
    controller.streetEdit!.text=Get.arguments['street'];
    controller.nameEdit!.text=Get.arguments['name'];
    String addressId=Get.arguments['addressId'].toString();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Text('edit address'.tr,style: textStyle.semiBold20,),
                const SizedBox(height: 5,),
                CustomTextForm(label: 'city'.tr, suffixIcon: Icons.location_on_outlined, controller: controller.cityEdit!, hint:'city hint'.tr, valid: (String?val){
                  return validInput(val!,3,50,"city");

                },keyboardType: TextInputType.text,),
                const SizedBox(height: 15,),
                CustomTextForm(label: 'street'.tr, suffixIcon: Icons.location_city, controller: controller.streetEdit!, hint:'street hint'.tr, valid: (String?val){
                  return validInput(val!,3,50,"street");

                },keyboardType: TextInputType.text,),
                const SizedBox(height: 15,),
                CustomTextForm(label: 'address classification'.tr, suffixIcon: Icons.home_outlined, controller: controller.nameEdit!, hint:'add class hint'.tr, valid: (String?val){
                  return validInput(val!,3,25,"name");

                },keyboardType: TextInputType.text,),
                const SizedBox(height: 15,),
                const SizedBox(height: 20,),
                CustomButton(text: 'save'.tr, onPressed: ()async{
                  if(key.currentState!.validate()){
                    await controller.updateAddress(addressId);
                  }
                },textStyle: textStyle.semiBold20.copyWith(color: Colors.white),),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
