import 'package:task_manager_project/data/models/user_model.dart';

class LogInModel {
  String? status;
  String? token;
  UserModel? userModel;

  LogInModel({this.status, this.token, this.userModel});

  LogInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];

    // Check if "data" exists and is a List, then get the first element if it exists
    if (json['data'] != null && json['data'] is List && json['data'].isNotEmpty) {
      userModel = UserModel.fromJson(json['data'][0]);
    } else {
      userModel = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (userModel != null) {
      data['data'] = [userModel!.toJson()]; // Wrap the user data in a list
    }
    return data;
  }
}
