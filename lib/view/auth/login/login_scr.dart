import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/alert_exit.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/auth/login/widget/custom_button.dart';
import 'package:ecommerce_app/view/auth/login/widget/custom_login_icon.dart';
import 'package:ecommerce_app/view/auth/login/widget/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../generated/assets.dart';


class LoginScr extends StatelessWidget {
  LoginScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(LoginControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Sign In'.tr,
          style: textStyle.Bold24,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(onWillPop:alertExitApp,child:GetBuilder<LoginControllerImpl>(
        builder: (controller)=> HandlingDataView(statusRequest: controller.statusRequest!, widget: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: controller.key,
            child: ListView(
              children: [
                Image.asset(
                  Assets.imagesLogo,
                  height: 120,
                ),
                Text(
                  'Welcome Back'.tr,
                  style: textStyle.Bold22,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                        'signin body'.tr,
                        textAlign: TextAlign.center,
                        style: textStyle.semiBold16
                            .copyWith(color: Colors.grey[700]))),
                const SizedBox(
                  height: 30,
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
                  height: 20,
                ),
                GetBuilder<LoginControllerImpl>(builder:(controller)=>CustomTextForm(
                    label: 'password'.tr,
                    valid: (val){
                      return validInput(val!,6,20,"password");
                    },
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: controller.sufIcon,
                    onPressed: controller.changeVisablity,
                    isPass: controller.isHidePass,
                    controller: controller.passwordController,
                    hint: 'enter password'.tr),),
                const SizedBox(
                  height: 10,
                ),
                Transform.translate(
                  offset: Offset(-6, 0),
                  child: InkWell(
                      onTap: () {
                        controller.toggleToForgetPass();
                      },
                      child: Text(
                        'forgot password'.tr,
                        style: textStyle.semiBold16.copyWith(color: Colors.red),
                        textAlign: TextAlign.end,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Sign In'.tr,
                  textStyle: textStyle.Bold22.copyWith(color: Colors.white),
                  onPressed: () {
                    if(controller.key.currentState!.validate()){
                      controller.login(controller.emailController.text,controller.passwordController.text);
                    }

                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'dont have acc'.tr,
                      style: textStyle.regular18,
                    ),
                    const SizedBox(width: 2,),
                    InkWell(
                      child: Text('signup'.tr,
                          style: textStyle.semiBold18
                              .copyWith(color: AppColors.primaryColor)),
                      onTap: () {
                        controller.toggleToSignUp();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.primaryColor,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    Text('or'.tr, style: textStyle.semiBold16),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.primaryColor,
                        )),
                  ],
                ),
                const SizedBox(height: 10,),
                CustomLoginIcon(
                  text: 'facebook login'.tr,
                  leading: SvgPicture.asset(Assets.imagesFacebookIcon),
                  onPressed: () {},
                ),
                const SizedBox(height: 15,),
                CustomLoginIcon(
                  text: 'google login'.tr,
                  leading: SvgPicture.asset(Assets.imagesGoogleIcon),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),)
      ),)
    );
  }
}
