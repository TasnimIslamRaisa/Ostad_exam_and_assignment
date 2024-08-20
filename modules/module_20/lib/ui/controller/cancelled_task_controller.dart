import 'package:get/get.dart';
import 'package:module_20/data/model/network_response.dart';
import 'package:module_20/data/model/task_list_wrapper.dart';
import 'package:module_20/data/model/task_model.dart';
import 'package:module_20/data/network_caller/network_caller.dart';
import 'package:module_20/data/utilities/urls.dart';

class CancelledTaskController extends GetxController {
  bool _canceledTaskInProgress = false;
  List<TaskModel> _canceledTaskList = [];
  String _errorMessage = '';

  bool get canceledTaskInProgress => _canceledTaskInProgress;

  List<TaskModel> get canceledTaskList => _canceledTaskList;

  String get errorMessage => _errorMessage;

  @override
  void onInit() {
    super.onInit();
    getCancelledTask();
  }

  Future<bool> getCancelledTask() async {
    bool isSuccess = false;

    _canceledTaskInProgress = true;
    update();

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.cancelledTasks);

    if (response.isSuccess) {
      TaskListWrapper taskListWrapperModel =
          TaskListWrapper.fromJson(response.responseData);
      _canceledTaskList = taskListWrapperModel.taskList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'Get new task failed! Try again';
      isSuccess = false;
    }

    _canceledTaskInProgress = false;
    update();

    return isSuccess;
  }
}
