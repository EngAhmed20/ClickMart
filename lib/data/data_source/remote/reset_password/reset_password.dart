import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class ResetPasswordData{
  Crud crud;
  ResetPasswordData(this.crud);
  resetPasswordData(String email,String password)async{
    var response=await crud.postData(AppLinks.resetPasswordLink,{
      'email':email,
      'password':password,
    });
    return response.fold((l)=>l,(r)=>r);

  }
}