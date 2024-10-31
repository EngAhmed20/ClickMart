import 'package:ecommerce_app/controller/auth/sign_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/functions/valid_input.dart';
import '../../../core/shared/app_style.dart';
import '../login/widget/custom_button.dart';
import '../login/widget/custom_textform.dart';

class SignUpScr extends StatelessWidget {
   SignUpScr({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:  Text(
            'signup'.tr,
            style: textStyle.Bold24,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<SignInControllerImpl>(
          builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest!, widget: Container(
            margin: EdgeInsets.only(top: 90),
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: controller.signUpKey,
              child: ListView(
                children: [
                  Text(
                    'signin title'.tr,
                    style: textStyle.Bold22,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CustomTextForm(
                      label: 'name'.tr,
                      valid: (val){
                        return validInput(val!,3,30,"username");
                      },
                      suffixIcon: Icons.person_outline,
                      controller: controller.userNameController,
                      hint: 'name form'.tr),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextForm(
                      label: 'email'.tr,
                      valid: (val){
                        return validInput(val!,5,100,"email");
                      },
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.email_outlined,
                      controller: controller.emailController,
                      hint: 'enter email'.tr),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextForm(
                      label: 'phone'.tr,
                      valid: (val){
                        return validInput(val!,10,13,"phone");
                      },
                      keyboardType: TextInputType.phone,
                      suffixIcon: Icons.phone,
                      controller: controller.phoneController,
                      hint: 'phone form'.tr),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextForm(
                      label: 'password'.tr,
                      valid: (val){
                        return validInput(val!,6,20,"password");
                      },
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: Icons.lock_outline,
                      controller: controller.passwordController,
                      hint: 'enter password'.tr),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: 'signup'.tr,
                    isLoading: controller.statusRequest==StatusRequest.loading,
                    textStyle: textStyle.Bold22.copyWith(color: Colors.white),
                    onPressed: () async{
                      if(controller.signUpKey.currentState!.validate()){
                        await controller.signUp();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'have acc'.tr,
                        style: textStyle.regular18,
                      ),
                      const SizedBox(width: 2,),
                      InkWell(
                        child: Text('Sign In'.tr,
                            style: textStyle.semiBold18
                                .copyWith(color: AppColors.primaryColor)),
                        onTap: () {
                          controller.toggleToLogin();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),),
        )
      );
    }


}
