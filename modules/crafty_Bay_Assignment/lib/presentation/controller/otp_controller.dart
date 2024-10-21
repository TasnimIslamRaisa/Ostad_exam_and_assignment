import 'dart:async';

import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class OTPController extends GetxController {
  var countdown = 120.obs;
  var isResendEnabled = false.obs;
  late Timer _timer;

  bool _inProgress = false;
  String? _errorMsg;
  String? get errorMsg => _errorMsg;
  bool get inProgess => _inProgress;

  String _accesstoken='';
  String get accesstoken=>_accesstoken;

  @override
  void onInit() {
    startCountdown();
    super.onInit();
  }

  void startCountdown() {
    isResendEnabled.value = false;
    countdown.value = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        isResendEnabled.value = true;
        _timer.cancel();
      }
    });
  }

  void resendCode() {
    // Add the code to resend the OTP here (e.g., API call)
    print("Resend code called");
    // Restart the countdown after resending the code
    startCountdown();
  }

  Future<bool> verifyOtp(String email,String otp,) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.verifyOtpUrl(email,otp));
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMsg = null;
      _accesstoken=response.responseData['data'];
      isSuccess = true;
    } else {
      _errorMsg = response.errorMsg;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
