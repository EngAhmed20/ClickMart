import 'package:ecommerce_app/controller/address_controller.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/shared/app_style.dart';
import 'package:ecommerce_app/view/home/address/widget/add_address.dart';
import 'package:ecommerce_app/view/home/address/widget/address_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerImpl controller = Get.put(AddressControllerImpl());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AddAddress(),
                );
              });
        },
        backgroundColor: AppColors.secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'address'.tr,
          style: textStyle.Bold28.copyWith(color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body:
      ListView(
        children: [
          GetBuilder<AddressControllerImpl>(
              builder: (controller) =>controller.addressModel.isNotEmpty? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.addressModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AddressListItem(addressModel: controller.addressModel[index], controller: controller,);
                    },
                  ):Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5),
                  child: Center(child: Text('no delivery address'.tr,style: textStyle.semiBold20,),)))
        ],
      ),
    );
  }
}
