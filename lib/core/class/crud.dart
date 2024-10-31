import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud{

  Future <Either<StatusRequest,Map>> postData (String linkUrl,Map data)async{
    try{
      if(await checkInternet()){
        var response=await http.post(Uri.parse(linkUrl),body: data);
        if(response.statusCode==200||response.statusCode==201){
          Map responseBody=jsonDecode(response.body);
          print("crud data \n ${responseBody}");
          return right(responseBody);
        }else{
          return const Left(StatusRequest.serverFailure);
        }

      }else{
        return left(StatusRequest.offlineFailure);

      }

    }catch(e){
      return const Left(StatusRequest.serverException);
    }

}
}