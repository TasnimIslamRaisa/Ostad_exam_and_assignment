

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/logInModel.dart';
import '../../data/models/network_response.dart';
import '../../data/restAPI/network_caller.dart';
import '../../data/urls.dart';
import 'auth_controller.dart';

class SignInController extends GetxController {
  bool _signInApiInProgress = false;
  String _errorMessage = '';

  bool get signInApiInProgress => _signInApiInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _signInApiInProgress = true;
    update();

    Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
    };

    final NetworkResponse response =
    await NetworkCaller.postRequest(Urls.login, body: requestData);
    if (response.isSuccess) {
      LogInModel loginModel = LogInModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserdata(loginModel.userModel!);

      isSuccess = true;
    } else {
      _errorMessage = response.errorMsg ?? 'Login failed! Try again';
    }

    _signInApiInProgress = false;
    update();

    return isSuccess;
  }
}