import 'package:flutter/material.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class PriceAndCount extends StatelessWidget {


   PriceAndCount({super.key, required this.price, required this.count, this.onAdd, this.onRemove, required this.priceBefDis, required this.disount});
   final int price;
   final int count;
   final int priceBefDis;
   final void Function()? onAdd;
   final void Function()? onRemove;
   final int disount;

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      IconButton(onPressed: onRemove, icon:Icon(Icons.remove)),
      Container(
        width: 40,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 3),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: Text('${count}',style: textStyle.regular18.copyWith(height: 2),),
      ),
      IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
      Spacer(),
      Column(children: [
        Text("${price}\$",style: textStyle.Bold28.copyWith(color: AppColors.secondaryColor),),
        if(disount!=0)
         Text("${priceBefDis}\$",style: textStyle.Bold24.copyWith(color:Colors.grey,decoration:TextDecoration.lineThrough),),


      ],),
    ],)
    ;
  }
}
