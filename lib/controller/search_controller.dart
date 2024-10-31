import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/functions/handling_data_controller.dart';
import '../data/data_source/model/items_model.dart';
import '../data/data_source/remote/home_data.dart';

class MixinSearchController extends GetxController{
  StatusRequest statusRequest=StatusRequest.none;
  HomeData homeData=HomeData(Get.find());


  bool isSearch=false;
  checkSearch(String value){
    if(value==""){
      statusRequest=StatusRequest.none;
      isSearch=false;
    }
    update();
  }
  onSearchItem()async{
    isSearch=true;
    update();
    await getSearchData();
  }
  List <ItemsModel> searchData=[];
  TextEditingController?searchController;
  @override
  getSearchData() async{
    statusRequest=StatusRequest.loading;
    print("status1${statusRequest}" );
    update();
    var response=await homeData.searchData(searchController!.text);
    statusRequest=handlingData(response);
    print("status2${statusRequest}" );
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        if (response['data'] is List) {
          searchData.clear();
          List responseData=response['data'];
          searchData.addAll(responseData.map((e)=>ItemsModel.fromJson(e)));
          print(searchData);

        }
        else{
          statusRequest=StatusRequest.failure;
          print("status4${statusRequest}" );

        }




      } else{
        statusRequest=StatusRequest.failure;
        print("status3${statusRequest}" );

      }

    }
    update();
  }
}
class MixinSearchOfferController extends GetxController{
  StatusRequest statusRequest=StatusRequest.none;
  HomeData homeData=HomeData(Get.find());


  bool isSearch=false;
  checkSearch(String value){
    if(value==""){
      statusRequest=StatusRequest.none;
      isSearch=false;
    }
    update();
  }
  onSearchItem()async{
    isSearch=true;
    update();
    await getSearchData();
  }
  List <ItemsModel> searchData=[];
  TextEditingController?searchController;
  @override
  getSearchData() async{
    searchData.clear();
    statusRequest=StatusRequest.loading;
    update();
    print("status1${statusRequest}" );
    update();
    var response=await homeData.searchOfferData(searchController!.text);
    statusRequest=handlingData(response);
    print("status2${statusRequest}" );
    if(StatusRequest.success==statusRequest){
      if(response['status']=='success'){
        if (response['data'] is List) {
          List responseData=response['data'];
          searchData.addAll(responseData.map((e)=>ItemsModel.fromJson(e)));

        }
        else{
          statusRequest=StatusRequest.failure;
          print("status4${statusRequest}" );

        }




      } else{
        statusRequest=StatusRequest.failure;
        print("status3${statusRequest}" );

      }

    }
    update();
  }
}