import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/auth/login/widget/custom_button.dart';
import 'package:ecommerce_app/view/home/chekout/widget/address_card.dart';
import 'package:ecommerce_app/view/home/chekout/widget/delivery_method.dart';
import 'package:ecommerce_app/view/home/chekout/widget/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout_controller.dart';
import '../../../core/constant/app_string.dart';
import '../../../core/functions/add_remove_cart_snackbar.dart';
import '../../../generated/assets.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            text: 'checkout'.tr,
            onPressed: () {
              controller.checkout();
            },
            textStyle: textStyle.Bold20.copyWith(color: Colors.white),
          ),
        ),
        appBar: AppBar(
          title: Text(
            'checkout'.tr,
            style: textStyle.Bold24.copyWith(color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: ListView(
                children: [
                  Text(
                    'choose payment method'.tr,
                    style: textStyle.Bold20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PaymentMethodCard(
                    text: 'cash pay',
                    isActive: controller.paymentMethod == 'cash' ? true : false,
                    onTap: () {
                      controller.choosePaymentMethod('cash');
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PaymentMethodCard(
                    text: 'card pay',
                    isActive: controller.paymentMethod == 'visa' ? true : false,
                    onTap: () {
                      controller.choosePaymentMethod('visa');
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'delivery method'.tr,
                    style: textStyle.Bold20,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DeliveryMethod(
                        text: 'home delivery',
                        imageName: '${Assets.images006Delivery}',
                        isActive: controller.deliveryType == 'home delivery'
                            ? true
                            : false,
                        onTap: () {
                          controller.chooseDeliveryType('home delivery');
                        },
                      ),
                      DeliveryMethod(
                        text: 'drive thru',
                        imageName: '${Assets.imagesDrivethru}',
                        isActive: controller.deliveryType == 'drive thru'
                            ? true
                            : false,
                        onTap: () {
                          controller.chooseDeliveryType('drive thru');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  if (controller.deliveryType == 'home delivery')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'shipping address'.tr,
                          style: textStyle.Bold20,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        if (controller.address.isNotEmpty)
                          ...List.generate(
                            controller.address.length,
                            (index) => CheckoutAddressCard(
                              text: '${controller.address[index].addressName}',
                              subText:
                                  '${controller.address[index].addressStreet}',
                              isActive: controller.addressId ==
                                      controller.address[index].addressId
                                  ? true
                                  : false,
                              onTap: () {
                                controller.chooseShippingAddress(
                                    controller.address[index].addressId!);
                              },
                            ),
                          )
                        else
                          Row(
                            children: [
                              Icon(Icons.arrow_right_outlined,size: 40,),
                              Expanded(
                                child: CustomButton(text: 'add delivery address'.tr, onPressed: (){
                                  controller.goToAddressPage();
                                },textStyle: textStyle.semiBold20.copyWith(color:AppColors.secondaryColor),backgroundColor: Colors.transparent,),
                              ),
                            ],
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
