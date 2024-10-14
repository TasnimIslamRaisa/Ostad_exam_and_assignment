import 'package:e_commers_app/data/models/category_model.dart';
import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/models/product_list_model.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/create_profile_model.dart';
import '../../data/models/product_model.dart';
import 'auth_controller.dart';

class CreateProfileController extends GetxController {
  bool _inProgress = false;
  bool get inprogress =>_inProgress;

  bool _isProfileCompleted = false;
  bool get isProfileCompleted =>_isProfileCompleted;

  String? _errorMsg;
  String? get errorMsg=>_errorMsg;

  Future<bool> postCreateProfileDetails( String firstName,
      String lastName,
      String mobile,
      String city,
      String shippingAddress,
      String postCode, // Consider using this dynamically
      String token,) async {

    bool isSuccess =false;
    _inProgress = true;
    update();

    Map<String, dynamic> completeProfile = {
      "cus_name": "$firstName $lastName",
      "cus_add": shippingAddress,
      "cus_city": city,
      "cus_state": city, // Assuming state is the same as city
      "cus_postcode": postCode,
      "cus_country": "Bangladesh",
      "cus_phone": mobile,
      "cus_fax": mobile,
      "ship_name": "$firstName $lastName",
      "ship_add": shippingAddress,
      "ship_city": city,
      "ship_state": city,
      "ship_postcode": postCode,
      "ship_country": "Bangladesh",
      "ship_phone": mobile,
      "created_at": DateTime.now()
          .toIso8601String(), // Better to dynamically assign timestamps
      "updated_at": DateTime.now().toIso8601String(),
    };

    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(
      url: Urls.createProfiletUrl,
      body: completeProfile, token: token, // Send profile data in the request body
     );
    if(response.isSuccess && response.responseData['msg']=='success'){
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