import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/default_dialog.dart';
import '../../data/data_source/remote/reset_password/check_email.dart';

abstract class ForgetPassController extends GetxController{
  toggleToVerifyCode();
  checkEmail( );

}

class ForgetPassControllerImpl extends ForgetPassController{
  late TextEditingController emailController;
  late GlobalKey<FormState>key;
  CheckEmailResetData checkEmailResetData=CheckEmailResetData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  @override
  checkEmail() async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await checkEmailResetData.checkEmailData(emailController.text);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest)
      {
        if(response['status']=='success'){
          toggleToVerifyCode();

        }else{
          defaultDialog("Error","Email Address doesn\'t exist");
        }

      }else{
      defaultDialog("Error", statusRequest as String);

    }
    update();


  }

  @override
  toggleToVerifyCode() {
    Get.offNamed('/verifyPass',arguments:{
      'email':emailController.text,
    });

  }
  @override
  void onInit() {
    key=GlobalKey();
    emailController=TextEditingController();
  }
  @override
  void onDispose() {
    emailController.dispose();
  }

}