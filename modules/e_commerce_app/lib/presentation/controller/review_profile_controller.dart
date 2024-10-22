import 'package:e_commers_app/data/models/review_list_model.dart';
import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/models/review_list_data_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'auth_controller.dart';

class ReviewProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  List<ReviewListData> _reviewList = [];

  List<ReviewListData> get reviewList => _reviewList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getReview(int productId) async {
    _reviewList.clear();
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.reviewListById(productId),
      token: AuthController.accessToken,
    );

    if (response.isSuccess) {
      final ReviewListModel reviewListModel = ReviewListModel.fromJson(response.responseData);
      _reviewList = (reviewListModel.reviewListData ?? []).cast<ReviewListData>();
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMsg;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}