import 'package:get/get.dart';

import 'controller/auth/sign_controller.dart';
import 'core/class/crud.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>SignInControllerImpl(),fenix: true);
    Get.put(Crud());
  }

}