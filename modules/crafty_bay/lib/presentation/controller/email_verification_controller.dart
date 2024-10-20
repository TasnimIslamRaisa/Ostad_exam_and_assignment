import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'auth_controller.dart';

class EmailVerificationController extends GetxController {
  bool _inProgress = false;
  String? _errorMsg;
  String? get errorMsg => _errorMsg;
  bool get inProgess => _inProgress;

  Future<bool> verifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.emailUrl(email));
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMsg = null;
      isSuccess = true;
    } else {
      _errorMsg = response.errorMsg;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
