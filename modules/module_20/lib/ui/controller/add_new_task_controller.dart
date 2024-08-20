import 'package:get/get.dart';
import 'package:module_20/data/model/network_response.dart';
import 'package:module_20/data/network_caller/network_caller.dart';
import 'package:module_20/data/utilities/urls.dart';

class AddNewTaskController extends GetxController {
  String _errorMessage = "";
  bool isLoading = false; // Add this line to manage loading state

  String get errorMessage => _errorMessage;

  Future<bool> addNewTask(String title, String description) async {
    bool isSuccess = false;
    isLoading = true;
    update(); // Notify listeners about the state change

    Map<String, dynamic> requestData = {
      "title": title,
      "description": description,
      "status": "New",
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createTask,
      body: requestData,
    );

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'New Task add failed !';
      isSuccess = false;
    }
    isLoading = false;
    update(); // Notify listeners about the state change
    return isSuccess;
  }
}
