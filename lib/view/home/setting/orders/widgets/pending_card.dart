import 'package:ecommerce_app/view/home/setting/orders/widgets/pending_order_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/app_string.dart';
import '../../../../../core/shared/app_style.dart';

class PendingBodyCard extends StatelessWidget {
  const PendingBodyCard({super.key, this.viewDetails, required this.orderNumber, required this.deliveryMethod, required this.paymentMethod, required this.orderPrice, required this.deliveryPrice, required this.totalPrice, required this.orderStatus, required this.date, required this.deleteOrder, this.archiveText});
  final void Function()? viewDetails;
  final String orderNumber;
  final String deliveryMethod;
  final String paymentMethod;
  final String orderPrice;
  final String deliveryPrice;
  final String totalPrice;
  final String orderStatus;
  final String date;
  final String? archiveText;
  final void Function()? deleteOrder;



  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.only(left:10,right: 10,top: 20,bottom: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.thirdColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          mainAxisSize:  MainAxisSize.max,
          children: [
            pendingOrderNumAndDate(label: 'order number',text: orderNumber, date: date,),
            const SizedBox(height: 30,),
            pendingOrderInfo(label: 'order delivery method', text: deliveryMethod),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order payment method'.tr, text: paymentMethod),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order price', text: '${orderPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'delivery price', text: '${deliveryPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'total price', text: '${totalPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order status', text: orderStatus, ),
            const SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(onPressed: viewDetails,child:  Text('order details'.tr,style: textStyle.semiBold18.copyWith(color: Colors.white),),color: AppColors.primaryColor,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: AppColors.thirdColor),
                ),padding: const EdgeInsets.all(10.0),),

                MaterialButton(onPressed: deleteOrder,child:  Text(archiveText??'cancel order'.tr,style: textStyle.semiBold18.copyWith(color: Colors.white),),color: Colors.red,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: AppColors.thirdColor),
                ),padding: const EdgeInsets.all(10.0),),


              ],
            ),






          ],
        ),
      ),
    );
  }
}
class ArchiveBodyCard extends StatelessWidget {

  const ArchiveBodyCard({super.key, this.viewDetails, required this.orderNumber, required this.deliveryMethod, required this.paymentMethod, required this.orderPrice, required this.deliveryPrice, required this.totalPrice, required this.orderStatus, required this.date, required this.deleteOrder, this.archiveText, this.rateOrder});
  final void Function()? viewDetails;
  final String orderNumber;
  final String deliveryMethod;
  final String paymentMethod;
  final String orderPrice;
  final String deliveryPrice;
  final String totalPrice;
  final String orderStatus;
  final String date;
  final String? archiveText;
  final void Function()? deleteOrder;
  final void Function()? rateOrder;



  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.only(left:10,right: 10,top: 20,bottom: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.thirdColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          mainAxisSize:  MainAxisSize.max,
          children: [
            pendingOrderNumAndDate(label: 'order number',text: orderNumber, date: date,),
            const SizedBox(height: 30,),
            pendingOrderInfo(label: 'order delivery method', text: deliveryMethod),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order payment method'.tr, text: paymentMethod),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order price', text: '${orderPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'delivery price', text: '${deliveryPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'total price', text: '${totalPrice}\$', ),
            const SizedBox(height: 15,),
            pendingOrderInfo(label: 'order status', text: orderStatus, ),
            const SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(onPressed: viewDetails,child:  Text('order details'.tr,style: textStyle.semiBold18.copyWith(color: Colors.white),),color: AppColors.primaryColor,shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: AppColors.thirdColor),
                    ),padding: const EdgeInsets.all(10.0),),
                    const SizedBox(height: 10,),
                    MaterialButton(onPressed: rateOrder,child:  Text('order rating'.tr,style: textStyle.semiBold18.copyWith(color: Colors.white),),color: AppColors.primaryColor,shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: AppColors.thirdColor),
                    ),padding: const EdgeInsets.all(10.0),),

                  ],

                ),
                Transform.translate(
                  offset: Offset(15, 50),
                  child: MaterialButton(onPressed: deleteOrder,child:  Text(archiveText??'cancel order'.tr,style: textStyle.semiBold18.copyWith(color: Colors.white),),color: Colors.red,shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: AppColors.thirdColor),
                  ),padding: const EdgeInsets.all(10.0),),
                ),



              ],
            ),






          ],
        ),
      ),
    );
  }
}
