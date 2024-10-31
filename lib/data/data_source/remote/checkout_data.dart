import 'package:ecommerce_app/core/constant/api_link.dart';

import '../../../core/class/crud.dart';

class CheckoutData{
  Crud crud;
  CheckoutData(this.crud);
  addOrder(Map data)async{
   var response=await crud.postData(AppLinks.checkoutOrderLink, data);
   return response.fold((l)=>l, (r)=>r);
  }

}