import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/default_dialog.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/user_model.dart';
import 'package:ecommerce_app/data/data_source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  login(String email ,String password);
  toggleToSignUp();
  toggleToForgetPass();
  changeVisablity();
  toggleToHome();

}
class LoginControllerImpl extends LoginController{
  late TextEditingController emailController;
  late TextEditingController passwordController ;
  GlobalKey <FormState>key=GlobalKey();
  MyServices myServices=Get.find();
  LoginData loginData=LoginData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
  late userData userdata;
  @override
  login(String email,String password) async{
    statusRequest=StatusRequest.loading;
    update();
   var response= await loginData.loginData(email, password);
   statusRequest =handlingData(response);
   if(StatusRequest.success==statusRequest){
     if(response['status']=="success"){
      userdata= userData.fromJson(response);
       print('sucessssss login ${userdata.data!.usesrId}');
       if(response['data']['users_approve']==1)
         {

           myServices.sharedPreferences.setString(userId, userdata.data!.usesrId.toString());
           myServices.sharedPreferences.setString('userName', userdata.data!.usersName.toString());
           myServices.sharedPreferences.setString('userEmail', userdata.data!.usersEmail.toString());
           myServices.sharedPreferences.setString('userPhone', userdata.data!.usersPhone.toString());

           toggleToHome();
         }
       else{
         Get.offNamed('/verifysignup',arguments: {
           "email":emailController.text
         });

       }


       
     }else{
       defaultDialog("Error", "email address or password is incorrect");
   }
     
   }else{
     defaultDialog("Error", statusRequest as String);
   }
   update();
  }
  bool isHidePass=false;
  IconData sufIcon= Icons.lock_open_outlined;
  void changeVisablity(){
    isHidePass=!isHidePass;
    sufIcon=isHidePass?Icons.lock_outline:Icons.lock_open_outlined;
    update();

  }

  @override
  toggleToSignUp() {
    Get.toNamed('/signup');
  }
  toggleToHome()async{
   await myServices.sharedPreferences.setBool('home', true);


   Get.offNamed('/home',arguments:{
      'userdata':userdata
    });

  }

  @override
  toggleToForgetPass() {
    Get.toNamed('/forgetPass');
  }
  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      String?token=value;
    });
    super.onInit();
  }

}