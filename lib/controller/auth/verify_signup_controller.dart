import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/default_dialog.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/data_source/remote/auth/singup_verify.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class VerifySignUpCodeController extends GetxController{
  toggleToSuccessPage();
  checkCode(String code);
  resendCode();

}

class VerifySignUpCodeControllerImpl extends VerifySignUpCodeController{
  late String verifyCode;
  String?userEmail;
  VerifyCodeSignupData verifyCodeSignupData=VerifyCodeSignupData(Get.find());
  StatusRequest? statusRequest;
   checkCode(String verifyCode)async {
    statusRequest == StatusRequest.loading;
    update();
    var response = await verifyCodeSignupData.postData(userEmail!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        toggleToSuccessPage();
      }else {
        defaultDialog("Error", "The verification code is invalid");
        return statusRequest=StatusRequest.failure;

      }
    }
    else{
      print("status request 4${statusRequest}");
      return statusRequest;
    }
    update();
  }

  @override
  toggleToSuccessPage() {
    Get.offNamed('/successSignUp');

  }
  @override
  void onInit() {
    userEmail=Get.arguments["email"];
    super.onInit();
  }

  @override
  resendCode() {
    verifyCodeSignupData.resendData(userEmail!);


  }

}