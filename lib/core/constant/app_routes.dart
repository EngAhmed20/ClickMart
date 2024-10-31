import 'package:ecommerce_app/core/middleware/app_middle_ware.dart';
import 'package:ecommerce_app/view/home/address/widget/add_address.dart';
import 'package:ecommerce_app/view/home/address/address_view.dart';
import 'package:ecommerce_app/view/home/address/widget/edit_address.dart';
import 'package:ecommerce_app/view/home/cart/cart_scr.dart';
import 'package:ecommerce_app/view/home/chekout/checkout_view.dart';
import 'package:ecommerce_app/view/home/favorite/favorite_scr.dart';
import 'package:ecommerce_app/view/home/product_details/product_details.dart';
import 'package:ecommerce_app/view/home/setting/orders/order_details.dart';
import 'package:ecommerce_app/view/home/setting/orders/orders_view.dart';
import 'package:ecommerce_app/view/home/setting/orders/archive_orders.dart';
import 'package:ecommerce_app/view/language/language_dart.dart';
import 'package:ecommerce_app/view/onBoarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../../view/auth/login/login_scr.dart';
import '../../view/auth/login/widget/forget_pass.dart';
import '../../view/auth/login/widget/reset_pass.dart';
import '../../view/auth/login/widget/success_reset.dart';
import '../../view/auth/login/widget/verify_code.dart';
import '../../view/auth/signUp/sign_up.dart';
import '../../view/auth/signUp/widget/sucess_signup.dart';
import '../../view/auth/signUp/widget/verify_signup.dart';
import '../../view/home/home_page.dart';
import '../../view/home/items/items.dart';
import '../../view/home/root_home.dart';
import '../../view/home/setting/orders/pending_orders.dart';
/*Map<String, Widget Function(BuildContext)>pageRoutes=
{
  '/' :(context)=>LangView(),
  '/login': (context)=>LoginScr(),
  '/onboarding': (context)=>OnBoardingView(),
  '/signup':(context)=>SignUpScr(),
  '/forgetPass':(context)=>ForgetPassScr(),
  '/resetPass':(context)=>ResetPassScr(),
  '/verifyPass': (context)=>VerifyCodeScr(),
  '/sucessResetPass': (context)=>SuccessResetPass(),
  '/successSignUp':(context)=>SuccessSignupScr(),
  '/verifysignup':(context)=>VerifySignUp(),

};*/
List<GetPage<dynamic>>? pageRoutes=[
 GetPage(name: '/', page:()=>LangView(),middlewares: [AppMiddleWare()]) ,
 //...pageRoutes
  GetPage(name: '/login', page:()=>LoginScr()) ,
  GetPage(name: '/onboarding', page:()=>OnBoardingView()) ,
  GetPage(name: '/signup', page:()=>SignUpScr()) ,
  GetPage(name: '/forgetPass', page:()=>ForgetPassScr()) ,
  GetPage(name: '/resetPass', page:()=>ResetPassScr()) ,
  GetPage(name: '/verifyPass', page:()=>VerifyCodeScr()) ,
  GetPage(name: '/sucessResetPass', page:()=>SuccessResetPass()) ,
  GetPage(name: '/successSignUp', page:()=>SuccessSignupScr()) ,
  GetPage(name: '/verifysignup', page:()=>VerifySignUp()) ,
  GetPage(name: '/home', page:()=>RootHome()) ,
  GetPage(name: '/items', page:()=>ItemsView()) ,
  GetPage(name: '/details', page:()=>ProductDetails()) ,
  GetPage(name: '/fav', page:()=>FavScr()) ,
  GetPage(name: '/cart', page:()=>CartScr()) ,
  GetPage(name: '/addressView', page:()=>AddressView()) ,
  GetPage(name: '/addAddress', page:()=>AddAddress()) ,
  GetPage(name: '/editAddress', page:()=>EditAddress()) ,
  GetPage(name: '/checkout', page:()=>CheckoutView()) ,
  GetPage(name: '/ordersview', page:()=>OrdersView()) ,
 GetPage(name: '/pendingorders', page:()=>PendingOrders()) ,
  GetPage(name: '/archivedorders', page:()=>ArchiveOrders()) ,
 GetPage(name: '/orderdetails', page:()=>OrderDetails()),
  //...pageRoutes






];