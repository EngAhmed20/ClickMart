import 'package:ecommerce_app/core/constant/api_link.dart';

import '../../../core/class/crud.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addData(String userId,String city,String addressName,String street)async{
    var response=await crud.postData(AppLinks.addressAddLink,{
      'usersid':userId,
      'city':city,
      'address_name':addressName,
     'street':street,
      'lat':'25.265212',
      'long':'55.276558'
    });
    return response.fold((l)=>l, (r)=>r);
  }
  updateData(String addressId,String city,String addressName,String street) async{
    var response=await crud.postData(AppLinks.addressUpdateLink,{
      'city':city,
      'address_name':addressName,
     'street':street,
      'lat':'25.265212',
      'long':'55.276558',
      'addressid':addressId,

    });
    return response.fold((l)=>l, (r)=>r);


  }
  deleteData(String addressId) async{
    var response=await crud.postData(AppLinks.addressDeleteLink,{'addressid':addressId});
    return response.fold((l)=>l, (r)=>r);

  }
  getAllData(String userId) async{
    var response=await crud.postData(AppLinks.addressLink,{
      'usersid':userId

    });
    return response.fold((l)=>l, (r)=>r);

  }
}