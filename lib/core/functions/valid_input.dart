import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

validInput(String val,int min,int max,String type){
 /* if(type=='username')
    {
      if(!GetUtils.isUsername(type))
        {
          return "not valid user name";
        }
    }
  if(type=='email')
  {
    if(!GetUtils.isEmail(type))
    {
      return "not valid email address";
    }
  }
  if(type=='phone')
  {
    if(!GetUtils.isPhoneNumber(type))
    {
      return "not valid phone number";
    }

  }*/
  if(val.isEmpty)
    {
      return "field can't be empty";
    }
  if(val.length<min)
    {
      return "value can't be less than $min";
    }
  if(val.length>max)
    {
      return "value can't be larger than $max";
    }

}