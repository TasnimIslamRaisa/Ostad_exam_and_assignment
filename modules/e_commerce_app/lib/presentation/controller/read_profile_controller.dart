import 'package:e_commers_app/data/models/category_model.dart';
import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/models/product_list_model.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';

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
    if(response.isSuccess){
      if(response.responseData['data']!=null){
        _isProfileCompleted = true;
        update();
      }
      isSuccess=true;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inProgress=false;
    update();
    return isSuccess;
  }
}