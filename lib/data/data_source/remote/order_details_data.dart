import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class OrderDetailsData{
  Crud crud;
  OrderDetailsData(this.crud);
  getData(String userId,String orderId)async{
    var response=await crud.postData(AppLinks.orderDetailsLink,{
      'userid':userId,
      'orderid':orderId,
    });
    return response.fold((l)=>l,(r)=>r);

  }
}