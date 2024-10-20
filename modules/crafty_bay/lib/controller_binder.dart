import 'package:crafty_bay/presentation/controller/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/controller/cart_list_controller.dart';
import 'package:crafty_bay/presentation/controller/category_list_controller.dart';
import 'package:crafty_bay/presentation/controller/create_profile_controller.dart';
import 'package:crafty_bay/presentation/controller/email_verification_controller.dart';
import 'package:crafty_bay/presentation/controller/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/controller/otp_controller.dart';
import 'package:crafty_bay/presentation/controller/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/controller/product_details_by_id_controller.dart';
import 'package:crafty_bay/presentation/controller/product_details_controller.dart';
import 'package:crafty_bay/presentation/controller/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/controller/read_profile_controller.dart';
import 'package:crafty_bay/presentation/controller/slider_list_controller.dart';
import 'package:crafty_bay/presentation/controller/special_product_list_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'data/services/network_caller.dart';
import 'presentation/controller/auth_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(Logger());
    Get.put(BottomNavbarController());
    Get.put(ProductListByCategoryController());
    Get.put(NetworkCaller(
      logger: Get.find<Logger>(),
      authController: Get.find<AuthController>(),));
    Get.put(SliderListController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductDetailsByIdController());
    Get.put(ProductDetailsController());
    Get.put(AuthController());
    Get.put(EmailVerificationController());
    Get.put(OTPController());
    Get.put(ReadProfileController());
    Get.put(CreateProfileController());
    Get.put(AddToCartController());
    Get.put(CartListController());

  }

}