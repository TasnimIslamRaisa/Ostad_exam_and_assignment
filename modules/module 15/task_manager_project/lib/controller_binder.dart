import 'package:get/get.dart';
import 'package:task_manager_project/ui/controller/auth_controller.dart';
import 'package:task_manager_project/ui/controller/sign_in_controller.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(SignInController());

  }
}