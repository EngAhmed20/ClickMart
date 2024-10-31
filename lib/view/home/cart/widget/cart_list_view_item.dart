import 'package:flutter/material.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.itemImg, required this.itemTitle, required this.itemPrice, required this.itemCount, this.addItem, this.removeItem});
  final String itemImg;
  final String itemTitle;
  final String itemPrice;
  final String itemCount;
  final void Function()? addItem;
  final void Function()? removeItem;


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomLeft: Radius.circular(20))
      ),
      elevation: 3,
      shadowColor: AppColors.secondaryColor,
      child:Row(
        children: [
          Expanded(flex:2,
              child: Image.network(itemImg)),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(itemTitle,style: textStyle.semiBold20,),
              subtitle: Text('${itemPrice}\$',style: textStyle.semiBold18.copyWith(color: AppColors.primaryColor),),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(onPressed: addItem, icon: const Icon(Icons.add),padding: EdgeInsets.zero,),
                Text(itemCount, style: textStyle.semiBold20,),
                IconButton(onPressed: removeItem, icon: const Icon(Icons.remove),padding: EdgeInsets.zero,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
