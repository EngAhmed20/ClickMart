
import 'package:ecommerce_app/core/constant/api_link.dart';

import '../../../../core/class/crud.dart';

class SignUpData{
  Crud crud;
  SignUpData(this.crud);

  postData(String name,String email,String phone,String password)async{
    var response=await crud.postData(AppLinks.signUpLink,{
      'username':name,
      'password':password,
      'email':email,
      'phone':phone,

    });
    return response.fold((l)=>l, (r)=>r);
  }
}