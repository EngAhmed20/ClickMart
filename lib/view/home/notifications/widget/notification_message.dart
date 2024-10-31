
import 'package:ecommerce_app/controller/notification_controller.dart';
import 'package:ecommerce_app/data/data_source/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/shared/app_style.dart';

class NotificationMessage extends GetView<NotificationController> {
  const NotificationMessage({super.key, required this.model});

  final NotificationModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ListTile(
        title: Text(
            model.notificationTitle!,
            style: textStyle.semiBold18),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.notificationBody!,
              style: textStyle.semiBold15,
            ),
            Text(
                Jiffy.parse(model.notificationDate!)
                    .fromNow(),
                style: textStyle.semiBold15),
          ],
        ),
        trailing:IconButton(onPressed: (){
          controller.deleteNotification(model.notificationId.toString());
        },icon:const Icon( Icons.delete),)
      ),
    );
  }
}
