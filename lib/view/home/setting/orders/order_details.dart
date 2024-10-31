import 'package:ecommerce_app/controller/order/order_details._controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/shared/app_style.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'order details'.tr,
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
        body: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: [
                  Table(
                    children: [
                      TableRow(children: [
                        Text(
                          'product'.tr,
                          style: textStyle.Bold20.copyWith(
                              color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'quantity'.tr,
                          style: textStyle.Bold20.copyWith(
                              color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'price'.tr,
                          style: textStyle.Bold20.copyWith(
                              color: AppColors.primaryColor),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      ...List.generate(
                        controller.data.length,
                        (index) => TableRow(children: [
                          Text(
                            translateDataBase(controller.data[index].itemsNameAr,controller.data[index].itemsName),
                            style: textStyle.semiBold20,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.data[index].countitems}',
                            style: textStyle.semiBold20,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${controller.data[index].itemsprice}',
                            style: textStyle.semiBold20,
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'total price'.tr,
                        style: textStyle.Bold20.copyWith(
                            color: AppColors.primaryColor),
                      ),
                      Text(
                        ': ${controller.orderModel.ordersTotalprice}\$',
                        style: textStyle.Bold22,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GetBuilder<OrderDetailsController>(
                      builder: (controller) => ListTile(
                            title: Text('shipping address'.tr,
                                style: textStyle.Bold20.copyWith(
                                    color: AppColors.primaryColor)),
                            subtitle: controller.data[0].addressId != null
                                ? Text(
                                    '${controller.data[0].addressCity}-${controller.data[0].addressStreet}-${controller.data[0].addressName}',
                                    style: textStyle.semiBold18)
                                : Text(
                                    'drive thru'.tr,
                                    style: textStyle.semiBold18,
                                  ),
                          ))
                ],
              ),
            ),
          ),
        ));
  }
}
