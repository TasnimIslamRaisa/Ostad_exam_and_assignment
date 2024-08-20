import 'package:get/get.dart';
import 'package:module_20/ui/controller/add_new_task_controller.dart';
import 'package:module_20/ui/controller/auth_controller.dart';
import 'package:module_20/ui/controller/cancelled_task_controller.dart';
import 'package:module_20/ui/controller/completed_task_controller.dart';
import 'package:module_20/ui/controller/in_progress_task_controller.dart';
import 'package:module_20/ui/controller/new_task_controller.dart';
import 'package:module_20/ui/controller/sign_in_controller.dart';
import 'package:module_20/ui/controller/update_task_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => NewTaskController());
    Get.lazyPut(() => CompletedTaskController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => CancelledTaskController());
    Get.lazyPut(() => InProgressTaskController());
    Get.lazyPut(() => AddNewTaskController());
    Get.lazyPut(() => UpdateProfileController());
  }
}
