import 'package:get/get.dart';
import 'package:module_20/data/model/login_model.dart';
import 'package:module_20/data/model/network_response.dart';
import 'package:module_20/data/network_caller/network_caller.dart';
import 'package:module_20/data/utilities/urls.dart';
import 'package:module_20/ui/controller/auth_controller.dart';

class SignInController extends GetxController {
  String _errorMessage = '';

  bool _signInApiProgress = false;

  bool get signInApiInprogress => _signInApiProgress;

  String get errorMessage => errorMessage;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _signInApiProgress = true;
    update();

    Map<String, dynamic> requestData = {
      "email": email,
      "password": password,
    };
    final NetworkResponse networkResponse =
        await NetworkCaller.postRequest(Urls.login, body: requestData);
    _signInApiProgress = false;
    update();
    if (networkResponse.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(networkResponse.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);
      isSuccess = true;
    } else {
      _errorMessage = networkResponse.errorMessage ?? 'Login Failed! Try again';
    }
    _signInApiProgress = false;
    update();
    return isSuccess;
  }
}
