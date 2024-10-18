import 'package:task_manager_project/data/models/task_count_status_model.dart';

class TaskCountByStatusWrapper {
  String? status;
  List<TaskCountByStatusModel>? taskCountByStatusList;

  TaskCountByStatusWrapper({this.status, this.taskCountByStatusList});

  TaskCountByStatusWrapper.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountByStatusList = <TaskCountByStatusModel>[];
      json['data'].forEach((v) {
        taskCountByStatusList!.add(new TaskCountByStatusModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.taskCountByStatusList != null) {
      data['data'] = this.taskCountByStatusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
