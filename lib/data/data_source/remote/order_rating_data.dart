import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class OrderRatingData{
  Crud crud;
  OrderRatingData(this.crud);
  sendRatingData(String orderId,String orderRate,String orderNote)async{
    var response=await crud.postData(AppLinks.orderRating,{
      'orderid':orderId,
      'orderrating':orderRate,
      'ratingnote':orderNote,

    });
    return response.fold((l)=>l,(r)=>r);
  }

}