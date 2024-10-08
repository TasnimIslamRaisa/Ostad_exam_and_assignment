import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_20/ui/controller/cancelled_task_controller.dart';
import 'package:module_20/ui/widgets/centered_progress_indicator.dart';
import 'package:module_20/ui/widgets/task_item.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch cancelled tasks when the screen initializes
    Get.find<CancelledTaskController>().getCancelledTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CancelledTaskController>(builder: (controller) {
        return Visibility(
          visible: !controller.canceledTaskInProgress,
          replacement: CenteredProgressIndicetor(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: controller.canceledTaskList.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  taskModel: controller.canceledTaskList[index],
                  onUpdateTask: () {
                    // Refresh tasks if needed
                    controller.getCancelledTask();
                  },
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
