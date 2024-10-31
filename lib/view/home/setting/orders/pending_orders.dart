import 'dart:ui';

import 'package:ecommerce_app/controller/order/order_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/home/setting/orders/widgets/pending_card.dart';
import 'package:ecommerce_app/view/home/setting/orders/widgets/pending_order_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/constant/app_string.dart';
import '../../../../../core/shared/app_style.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'pending orders'.tr,
            style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 30,
              )),
        ),
        body: GetBuilder<OrderController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) =>
                            controller.data[index].ordersStatus!=4?
                            PendingBodyCard(
                          orderNumber: '${controller.data[index].ordersId}',
                          date: '${controller.data[index].ordersDatetime}',
                          deleteOrder: ()async{
                            await controller.deleteOrder(controller.data[index].ordersId.toString());
                          },
                          deliveryMethod:
                              '${controller.data[index].ordersType}',
                          paymentMethod:
                              '${controller.data[index].ordersPaymentmethod}',
                          orderPrice: '${controller.data[index].ordersPrice}',
                          deliveryPrice:
                              '${controller.data[index].ordersPricedelivery}',
                          totalPrice:
                              '${controller.data[index].ordersTotalprice},',
                          orderStatus: controller.getOrderStatus(
                              controller.data[index].ordersStatus!),
                          viewDetails: () {
                           Get.toNamed('/orderdetails',arguments: {
                             'orderModel':controller.data[index]
                           });
                          },
                        ):const SizedBox(height: 0,),
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ],
                  ),
                  failureText: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'empty order'.tr,
                        style: textStyle.semiBold20,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )));
  }
}
