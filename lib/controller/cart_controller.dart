import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/app_string.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/cart_model.dart';
import 'package:ecommerce_app/data/data_source/model/cart_price_count_model.dart';
import 'package:ecommerce_app/data/data_source/remote/cart_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/add_remove_cart_snackbar.dart';

abstract class CartController extends GetxController {
  addToCart(
    String itemId,
  );
  removeFromCart(String itemId);
  getCountItemCart(String itemId);
  viewCartItems();
  applyCoupon();
  goToCheckout();
}

class CartControllerImpl extends CartController {
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest getData = StatusRequest.none;
  TextEditingController? couponController;

  @override
  addToCart(itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addToCart(
        myServices.sharedPreferences.getString(userId)!, itemId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        add_removeSnack('addtocart');
      }
    } else {
      return statusRequest;
    }
    update();
    viewCartItems();
  }

  @override
  removeFromCart(itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.removeFromCart(
        myServices.sharedPreferences.getString(userId)!, itemId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        add_removeSnack('removefromcart');
      }
    } else {
      return statusRequest;
    }
    viewCartItems();
    update();
  }

  @override
  getCountItemCart(itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getItemCountCart(
        myServices.sharedPreferences.getString(userId)!, itemId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int itemCount = 0;
        itemCount = response['data'];
        print("count:  + ${itemCount}");
        statusRequest = StatusRequest.success;
        return itemCount;
      }
    } else {
      print("status: ${statusRequest}");
    }

    update();
  }

  List<CartModel> data = [];
  int totalItemsPrice = 0;
  int totalItemsCount = 0;
  late CartModel cartModel;
  late CartPriceCountModel cartPriceCountModel;
  @override
  viewCartItems() async {
    getData = StatusRequest.loading;
    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString(userId)!,
    );
    getData = handlingData(response);
    if (StatusRequest.success == getData) {
      if (response['countprice'] != false) {
        data.clear();
        List dataResponse = response['datacart'];
        Map dataCountAndPrice = response['countprice'];
        data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
        cartPriceCountModel =
            CartPriceCountModel.fromJson(response['countprice']);
        totalItemsCount = int.parse(cartPriceCountModel.totalcount!);
        totalItemsPrice = cartPriceCountModel.totalprice!;

        // List<CartModel> cartItems = dataResponse.map((item) => CartModel.fromJson(item)).toList();
        print(
            "suceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeesw cart ${cartPriceCountModel.totalprice}");
        getData = StatusRequest.success;
        calcAllCost(totalItemsPrice,discount);
      } else {
        getData = StatusRequest.failure;
      }
    } else {
      getData = StatusRequest.failure;
      print("s3");
    }
    update();
  }
String? couponName ;
  int? couponId;
  int discount = 0;

  @override
  applyCoupon() async {
    var response = await cartData.applyCoupon(couponController!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        discount = response['data']['coupon_discount'];
        couponName=response['data']['coupon_name'];
        couponId = response['data']['coupon_id'];
        calcAllCost(totalItemsPrice!,discount);
      } else {
        add_removeSnack('coupon invalid'.tr,
            icon: Icons.error_outline, iconColor: Colors.red);

      }
    }
    update();
  }

  @override
  void onInit() {
    viewCartItems();
    couponController = TextEditingController();

    super.onInit();
  }

  double totalCost = 0.0;

  calcAllCost(int itemsPrice, discount) {
    if (discount > 0) {
      totalCost = (itemsPrice - (itemsPrice * discount / 100));
    } else {
      totalCost = double.parse('${itemsPrice}');
    }
    update();
  }

  @override
  goToCheckout() {
   Get.toNamed('/checkout',arguments: {
     "couponId":couponId??0,
     "priceOrder":double.parse('${totalItemsPrice}'),
   });
  }
}
