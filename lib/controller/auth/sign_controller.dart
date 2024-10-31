import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/data/data_source/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/default_dialog.dart';
abstract class SignInController extends GetxController{
  signUp();
  toggleToLogin();
}

class SignInControllerImpl extends SignInController {
  late TextEditingController emailController;
  late TextEditingController passwordController ;
  late TextEditingController userNameController ;
  late TextEditingController phoneController;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  SignUpData signUpData=SignUpData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  List userData=[];
  @override
   signUp() async{
    statusRequest=StatusRequest.loading;
    update();
    print("status request 1${statusRequest}");
    var response=await signUpData.postData(userNameController.text, emailController.text, phoneController.text, passwordController.text);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success")
        {
          print("status request 2${statusRequest}");
          //userData.addAll(response);
          Get.offNamed('/verifysignup',arguments: {
            "email":emailController.text
          });

        }else{
        defaultDialog("warning","Phone Number Or Email Address Already Exist");
        print("status request .${statusRequest}");

        return statusRequest=StatusRequest.failure;

      }

    }else{
      print("status request 4${statusRequest}");
      return statusRequest;
    }

    update();


  }



  @override
  toggleToLogin() {
    Get.back();
  }
  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    userNameController=TextEditingController();
    phoneController=TextEditingController();
    super.onInit();


  }

}