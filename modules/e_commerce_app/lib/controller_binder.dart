import 'package:e_commers_app/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BottomNavbarController());
  }

}