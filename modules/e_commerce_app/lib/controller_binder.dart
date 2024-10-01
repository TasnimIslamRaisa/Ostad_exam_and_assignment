import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:e_commers_app/presentation/controller/category_list_controller.dart';
import 'package:e_commers_app/presentation/controller/slider_list_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BottomNavbarController());
    Get.put(Logger());
    Get.put(NetworkCaller(Get.find<Logger>()));
    Get.lazyPut(()=>SliderListController());
    Get.lazyPut(()=>CategoryListController());
  }

}