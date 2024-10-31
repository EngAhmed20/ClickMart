import 'package:ecommerce_app/view/home/setting/orders/widgets/pending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/order/order_controller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/functions/rating_dialog.dart';
import '../../../../core/shared/app_style.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'order archive'.tr,
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
              statusRequest: controller.archiveStatus,
              widget: ListView(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) =>
                        ArchiveBodyCard(
                      orderNumber: '${controller.archivedData[index].ordersId}',
                      date: '${controller.archivedData[index].ordersDatetime}',
                      deleteOrder: ()async{
                        await controller.deleteArchivedOrder(controller.archivedData[index].ordersId.toString());
                      },
                      deliveryMethod:
                      '${controller.archivedData[index].ordersType}',
                      paymentMethod:
                      '${controller.archivedData[index].ordersPaymentmethod}',
                      orderPrice: '${controller.archivedData[index].ordersPrice}',
                      deliveryPrice:
                      '${controller.archivedData[index].ordersPricedelivery}',
                      totalPrice:
                      '${controller.archivedData[index].ordersTotalprice},',
                      orderStatus: controller.getOrderStatus(
                          controller.archivedData[index].ordersStatus!),
                      archiveText: 'remove order'.tr,
                      viewDetails: () {
                        Get.toNamed('/orderdetails',arguments: {
                          'orderModel':controller.data[index],
                        });
                      },
                          rateOrder: (){
                            showDialogRating(context,controller.archivedData[index].ordersId.toString());
                          },
                    ),
                    itemCount: controller.archivedData.length,
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
