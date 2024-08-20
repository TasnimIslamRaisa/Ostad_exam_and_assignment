import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_20/data/model/network_response.dart';
import 'package:module_20/data/model/task_by_status_count_wrapper.dart';
import 'package:module_20/data/model/task_count_by_status_model.dart';
import 'package:module_20/data/network_caller/network_caller.dart';
import 'package:module_20/data/utilities/urls.dart';
import 'package:module_20/ui/controller/new_task_controller.dart';
import 'package:module_20/ui/screens/add_new_task_screen.dart';
import 'package:module_20/ui/utility/app_colors.dart';
import 'package:module_20/ui/widgets/centered_progress_indicator.dart';
import 'package:module_20/ui/widgets/task_item.dart';
import 'package:module_20/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  // bool _getNewTaskInProgress = false;
  bool _getTaskCountInProgress = false;
  //List<TaskModel> newTaskList = [];
  List<TaskCountByStatusModel> taskCountByStatusList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialCall();
  }

  void _initialCall() {
    _getTaskCountByStatus();
    Get.find<NewTaskController>().getNewTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: profileAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            _buildSummarySection(),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _initialCall();
                },
                child:
                    GetBuilder<NewTaskController>(builder: (newTaskController) {
                  return Visibility(
                    visible: newTaskController.getNewTasksInProgress == false,
                    replacement: CenteredProgressIndicetor(),
                    child: ListView.builder(
                      itemCount: newTaskController.newTaskList.length,
                      itemBuilder: (context, index) {
                        return TaskItem(
                          onUpdateTask: () {
                            Get.find<NewTaskController>().getNewTasks();
                            _getTaskCountByStatus();
                          },
                          taskModel: newTaskController.newTaskList[index],
                        );
                      },
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddButton,
        child: Icon(Icons.add),
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  void _onTapAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewTaskScreen(),
      ),
    );
  }

  // SingleChildScrollView _buildSummarySection() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [
  //         TaskSummaryCard(title: 'New Task', count: '12'),
  //         TaskSummaryCard(title: 'Completed', count: '12'),
  //         TaskSummaryCard(title: 'Progress', count: '12'),
  //         TaskSummaryCard(title: 'Cancled', count: '12'),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildSummarySection() {
    return Visibility(
      visible: _getTaskCountInProgress == false,
      replacement: SizedBox(
          height: 100,
          child: Center(
            child: CircularProgressIndicator(),
          )),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: taskCountByStatusList.map(
            (e) {
              return TaskSummaryCard(
                title: (e.sId ?? 'Unknown').toUpperCase(),
                count: e.sum.toString(),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Future<void> _getTaskCountByStatus() async {
    _getTaskCountInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.taskStatusCount);
    if (response.isSuccess) {
      TaskCountByStatusWrapperModel taskCountByStatusWrapperModel =
          TaskCountByStatusWrapperModel.fromJson(response.responseData);
      taskCountByStatusList =
          taskCountByStatusWrapperModel.taskCountByStatusList ?? [];
    } else {
      if (mounted) {
        /*showSnackBarMessage(context,
            response.errorMessage ?? 'Get new task count by failed! Try again');*/
      }
    }
    _getTaskCountInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
