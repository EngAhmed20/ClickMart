import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/default_dialog.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_source/remote/reset_password/reset_password.dart';

abstract class ResetPassController extends GetxController{
  toggleToSuccessScr();
  resetPass( );

}

class ResetPassControllerImpl extends ResetPassController{
  late TextEditingController passController;
  late TextEditingController confirmPassController;
  String?email;
  ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  @override
  resetPass() async{
statusRequest =StatusRequest.loading;
if(passController.text!=confirmPassController.text)
  {
     defaultDialog('Password Error', 'New Password and Confirm Password don\'t match') ;
  }else{
  var response=await resetPasswordData.resetPasswordData(email!, passController.text);
  statusRequest =handlingData(response);
  if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      toggleToSuccessScr();
    }else{
      defaultDialog('Error', 'Failed to reset password');

    }

  }else{
    defaultDialog('Error', 'Try Again');

  }
  }
update();
  }

  @override
  toggleToSuccessScr() {
    Get.offNamed('/sucessResetPass');

  }
  @override
  void onInit() {
    passController=TextEditingController();
    confirmPassController=TextEditingController();
    email=Get.arguments['email'];

  }
  @override
  void onDispose() {
    passController.dispose();
    confirmPassController.dispose();
  }

}