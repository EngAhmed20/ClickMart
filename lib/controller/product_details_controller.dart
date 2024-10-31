import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/data_source/model/items_model.dart';
import 'package:ecommerce_app/view/home/cart/widget/items_count.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{
  initData();
  incItemQuantity();
  decItemQuantity();
  priceAfterChangeQuantity(int quantity);

}
class ProductDetailsControllerImpl extends ProductDetailsController{
  CartControllerImpl cartController=Get.put(CartControllerImpl());
  MyServices myServices=Get.find();
  late ItemsModel item;
  late int itemPrice;
  int? chosenColorId;
  StatusRequest statusRequest=StatusRequest.none;
  int quantity=0;
  String? deliveryTime;
  List itemColor=[
    {
      "name":'red'.tr,
      "id":1,
      "active":false
    },
    {
      "name":'blue'.tr,
      "id":2,
      "active":false
    },  {
      "name":'black'.tr,
      "id":3,
      "active":false
    },  {
      "name":'white'.tr,
      "id":4,
      "active":false
    },

  ];
  changeColor(int index ){
    itemColor.forEach((item)=>item['active']=false);
    if(index==0){
      itemColor[0]['active']=true;
      chosenColorId=itemColor[index]['id'];

      //update();

    }
    if(index==1){
      itemColor[1]['active']=true;
      chosenColorId=itemColor[index]['id'];

      //update();

    }
    if(index==2){
      itemColor[2]['active']=true;
      chosenColorId=itemColor[index]['id'];

      //update();

    }
    if(index==3){
      itemColor[3]['active']=true;
      chosenColorId=itemColor[index]['id'];

      //update();

    }
    print('chosenColorId ${chosenColorId}');
    update();
  }
  @override
  initData() async{
    statusRequest=StatusRequest.loading;
    item=Get.arguments['item'];
    itemPrice=item.itemsPrice!;
    print(itemPrice);
    print(item.itemsDiscount);
    print(item.itemsName);
    print(item.itemsPriceDiscount);
   quantity=await cartController.getCountItemCart(item.itemsId.toString());
    statusRequest=StatusRequest.success;
    update();
  }
  @override
  void onInit() async{
    print('start init');
    await initData();
    deliveryTime=await myServices.sharedPreferences.getString('delivery time');
    super.onInit();
  }

  @override
  incItemQuantity() {
    quantity++;
    priceAfterChangeQuantity(quantity);
    cartController.addToCart(item.itemsId.toString());


  }

  @override
  decItemQuantity() {
    if (quantity>1) {
      quantity--;
    }else{
      quantity=0;
    }
    cartController.removeFromCart(item.itemsId.toString());
    priceAfterChangeQuantity(quantity);

  }

  @override
  priceAfterChangeQuantity( quantity) {
    if(quantity==0){
      itemPrice=item.itemsPrice!;

    }
    else{
      itemPrice=item.itemsPrice!*quantity;

    }
      update();
  }
  goToCart(){
    Get.toNamed('/cart');
  }

}