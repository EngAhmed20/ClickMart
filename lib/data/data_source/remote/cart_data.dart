import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';
import 'package:ecommerce_app/view/home/cart/widget/items_count.dart';

class CartData{
  Crud crud;

  CartData(
    this.crud);
  addToCart(String userId, String itemId,)async{
   var response=await crud.postData(AppLinks.addToCartLink, {
      'usersid':userId,
      'itemsid':itemId,


   });
   return response.fold((l) => l, (r) => r);
  }
  removeFromCart(String userId, String itemId)async{
    var response=await crud.postData(AppLinks.deleteCartLink, {
      'usersid':userId,
      'itemsid':itemId,


    });
    return response.fold((l) => l, (r) => r);
  }
  getItemCountCart(String userId, String itemId)async{
    var response=await crud.postData(AppLinks.cartGetCountItem, {
      'usersid':userId,
      'itemsid':itemId,


    });
    return response.fold((l) => l, (r) => r);
  }
  viewCart(String userId)async{
    var response=await crud.postData(AppLinks.cartView, {
      'usersid':userId,


    });
    return response.fold((l) => l, (r) => r);
  }
  applyCoupon(String name)async{
    var response=await crud.postData(AppLinks.couponLink,{
      'couponName':name,
    });
    return response.fold((l) => l, (r) => r);

  }



}