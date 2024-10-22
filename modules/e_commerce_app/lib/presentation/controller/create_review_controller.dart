import 'package:e_commers_app/data/models/category_model.dart';
import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/models/product_list_model.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/create_profile_model.dart';
import '../../data/models/product_model.dart';
import 'auth_controller.dart';

class CreateReviewController extends GetxController {
  bool _inProgress = false;
  bool get inprogress => _inProgress;

  bool _isProfileCompleted = false;
  bool get isProfileCompleted => _isProfileCompleted;

  String? _errorMsg;
  String? get errorMsg => _errorMsg;

  Future<bool> postCreateReview(
    String firstName,
    String lastName,
    String description,
    int productId,
    int rating,
  ) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> completeReview = {
      "cus_name": "$firstName $lastName",
      "description": "$description",
      "product_id": productId,
      "rating": "$rating"
    };

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      url: Urls.createReviewtUrl,
      body: completeReview,
      token:
          AuthController.accessToken, // Send profile data in the request body
    );
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      isSuccess = true;
      _errorMsg = null;
    } else {
      _errorMsg = response.errorMsg;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
