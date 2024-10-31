import 'package:ecommerce_app/data/data_source/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/address_controller.dart';
import '../../../../core/shared/app_style.dart';

class AddressListItem extends StatelessWidget {
  const AddressListItem(
      {super.key, required this.addressModel, required this.controller});
  final AddressModel addressModel;
  final AddressControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(
          "${'city'.tr}:  ${addressModel.addressCity!}",
          style: textStyle.semiBold20,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${'street'.tr}:  ${addressModel.addressStreet!}",
                style: textStyle.semiBold16.copyWith(color: Colors.grey[21])),
            Text(addressModel.addressName!,
                style: textStyle.semiBold16.copyWith(color: Colors.grey[21])),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                await controller.deleteAddress(addressModel.addressId.toString());
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: ()  {
                Get.toNamed('/editAddress',arguments: {
                  'city':addressModel.addressCity,
                  'street':addressModel.addressStreet,
                  'name':addressModel.addressName,
                  'addressId':addressModel.addressId,
                });
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
                size: 30,
              ),
            ),

          ],
        ),
        onTap: () {
          Get.back(); // Navigate back to the previous screen
        },
      ),
    );
  }
}
