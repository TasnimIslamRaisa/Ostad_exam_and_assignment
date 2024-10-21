import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import 'auth_controller.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  bool get inprogress =>_inProgress;

  bool _isProfileCompleted = false;
  bool get isProfileCompleted =>_isProfileCompleted;

  String? _errorMsg;
  String? get errorMsg=>_errorMsg;

  Future<bool> getProfileDetails(String token) async {

    bool isSuccess =false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(
        url: Urls.readProfiletUrl,
        token: token,
    );
    print("Read Token : $token");
    if(response.isSuccess){
      if(response.responseData['data']!=null){
        _isProfileCompleted = true;
        await Get.find<AuthController>().saveAccessToken(token);
        //update();
      }
      isSuccess=true;
      _errorMsg=null;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inProgress=false;
    update();
    return isSuccess;
  }
}