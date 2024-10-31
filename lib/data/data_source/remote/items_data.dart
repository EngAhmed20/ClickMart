import 'package:ecommerce_app/core/constant/api_link.dart';

import '../../../core/class/crud.dart';

class ItemsData{
  Crud crud;
  ItemsData(this.crud);
  getData(String cat_id,String user_id)async{
    var response=await crud.postData(AppLinks.itemsLink,{
      'category_id':cat_id,
      'userid':user_id
    });
    return response.fold((l)=>l, (r)=>r);

  }

}