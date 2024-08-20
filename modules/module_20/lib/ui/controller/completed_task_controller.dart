import 'package:get/get.dart';
import 'package:module_20/data/model/network_response.dart';
import 'package:module_20/data/model/task_list_wrapper.dart';
import 'package:module_20/data/model/task_model.dart';
import 'package:module_20/data/network_caller/network_caller.dart';
import 'package:module_20/data/utilities/urls.dart';

class CompletedTaskController extends GetxController {
  bool _getCompletedTaskInProgress = false;
  List<TaskModel> completedTaskList = [];
  String _errorMessage = '';

  bool get getCompletedTasksInProgress => _getCompletedTaskInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> getCompletedTasks() async {
    bool isSuccess = false;
    _getCompletedTaskInProgress = true;
    update();
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.completedTasks);
    if (response.isSuccess) {
      TaskListWrapper taskListWrapperModel =
          TaskListWrapper.fromJson(response.responseData);
      completedTaskList = taskListWrapperModel.taskList ?? [];
    } else {
      _errorMessage = response.errorMessage ?? 'Get new task failed! Try again';
    }
    _getCompletedTaskInProgress = false;
    update();
    return isSuccess;
  }
}
