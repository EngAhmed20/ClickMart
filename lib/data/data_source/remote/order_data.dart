import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/api_link.dart';

class OrderData{
  Crud crud;
  OrderData(this.crud);
  getData(String userId)async
  {
    var response=await crud.postData(AppLinks.pendingOrdersLink, {
      'userid': userId
    });
    return response.fold((l)=>l, (r)=>r);
  }
  deleteOrder(String orderId)async{
    var response=await crud.postData(AppLinks.deleteOrdersLink,{
      'orderid':orderId
    });
    return response.fold((l)=>l, (r)=>r);
  }
  //archive order
  getArchiveData(String userId)async
  {
    var response=await crud.postData(AppLinks.archivedOrdersLink, {
      'userid': userId
    });
    return response.fold((l)=>l, (r)=>r);
  }
  deleteArchivedOrder(String orderId)async{
    var response=await crud.postData(AppLinks.deleteArchivedOrder,{
      'orderid':orderId
    });
    return response.fold((l)=>l, (r)=>r);
  }

}