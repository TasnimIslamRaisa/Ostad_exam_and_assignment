import 'package:get/get.dart';
import 'package:module_20/data/model/network_response.dart';
import 'package:module_20/data/model/task_list_wrapper.dart';
import 'package:module_20/data/model/task_model.dart';
import 'package:module_20/data/network_caller/network_caller.dart';
import 'package:module_20/data/utilities/urls.dart';

class NewTaskController extends GetxController {
  bool _getNewTasksInProgress = false;
  List<TaskModel> _taskList = [];
  String _errorMessage = '';

  bool get getNewTasksInProgress => _getNewTasksInProgress;

  List<TaskModel> get newTaskList => _taskList;

  String get errorMessage => _errorMessage;

  Future<bool> getNewTasks() async {
    bool isSuccess = false;
    _getNewTasksInProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(Urls.newTasks);
    if (response.isSuccess) {
      TaskListWrapper taskListWrapperModel =
          TaskListWrapper.fromJson(response.responseData);
      _taskList = taskListWrapperModel.taskList ?? [];
    } else {
      _errorMessage = response.errorMessage ?? 'Get new task failed! Try again';
    }

    _getNewTasksInProgress = false;
    update();

    return isSuccess;
  }
}
