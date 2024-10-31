import 'package:ecommerce_app/core/constant/api_link.dart';

import '../../../../core/class/crud.dart';

class CheckEmailResetData{
  Crud crud;
  CheckEmailResetData(this.crud);
  checkEmailData(String email)async{
   var response=await crud.postData(AppLinks.checkEmailLink, {
     "email":email,
   });
  return  response.fold((l)=>l,(r)=>r);
  }

}