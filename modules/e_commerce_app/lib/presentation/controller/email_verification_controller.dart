import 'dart:ui';

import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:get/get.dart';

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
