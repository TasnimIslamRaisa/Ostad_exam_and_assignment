import 'package:get/get.dart';
import 'package:module_20/data/model/network_response.dart';
import 'package:module_20/data/model/task_list_wrapper.dart';
import 'package:module_20/data/model/task_model.dart';
import 'package:module_20/data/network_caller/network_caller.dart';
import 'package:module_20/data/utilities/urls.dart';

class InProgressTaskController extends GetxController {
  String _errorMessage = '';
  bool _getTaskInProgress = false;
  List<TaskModel> _taskList = [];

  bool get getTaskInProgress => _getTaskInProgress;
  String get errorMessage => _errorMessage;
  List<TaskModel> get taskList => _taskList;

  Future<void> fetchInProgressTasks() async {
    _getTaskInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.newTasks);

    if (response.isSuccess) {
      TaskListWrapper taskListWrapper =
          TaskListWrapper.fromJson(response.responseData);
      _taskList = taskListWrapper.taskList ?? [];
      _errorMessage = ''; // Clear any previous error messages
    } else {
      _errorMessage = response.errorMessage ?? 'Get new task failed! Try again';
      // Optionally, you can use GetX's snackbar or other error handling mechanisms here
      Get.snackbar('Error', _errorMessage);
    }

    _getTaskInProgress = false;
    update();
  }
}
