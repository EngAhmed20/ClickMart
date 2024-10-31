import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class VerifyCodeSignupData{
  Crud crud;
  VerifyCodeSignupData(this.crud);
  postData(String email,String code)async{
    var response=await crud.postData(AppLinks.verifySignCode,{
      "email":email,
      "verifycode":code
    });
    return response.fold((l)=>l, (r)=>r);
  }
  resendData(String email)async{
    var response=await crud.postData(AppLinks.resendVerifyCode,{
      "email":email,});
    return response.fold((l)=>l, (r)=>r);


}
}