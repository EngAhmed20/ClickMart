import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/home/notifications/widget/notification_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/shared/app_style.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
        body: GetBuilder<NotificationController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          child: ListView(
            children: [
              Text(
                'notification'.tr,
                style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => NotificationMessage(model: controller.notifications[index],),
                itemCount: controller.notifications.length,
              ),
            ],
          ),
        ),
        failureText: Text(
          'empty notification'.tr,
          style: textStyle.semiBold20,
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
