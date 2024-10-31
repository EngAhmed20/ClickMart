import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class OffersData{
  Crud crud;
  OffersData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinks.offersItem,{
    });
    return response.fold((l)=>l, (r)=>r);
  }

}