import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/product_details_model.dart';
import '../../data/models/product_model.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inprogress =>_inProgress;

  String? _errorMsg;

  String? get errorMsg=>_errorMsg;

  ProductDetailsModel? _productDetailsModel;

  ProductDetailsModel? get productDetailsModel=>_productDetailsModel;

  Future<bool> getProductDetails(int productId,) async {

    bool isSuccess =false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productDetailsByID(productId));

    if (response.isSuccess) {
      try {
        _errorMsg = null;

        // Ensure response data contains 'data' field and process the first item
        if (response.responseData != null && response.responseData['data'] != null) {
          _productDetailsModel = ProductDetailsModel.fromJson(response.responseData['data'][0]);
          isSuccess = true;
        } else {
          _errorMsg = "Product details not found.";
        }
      } catch (e) {
        _errorMsg = "Error parsing product details.";
      }
    } else {
      _errorMsg = response.errorMsg ?? "Failed to fetch product details.";
    }


    _inProgress=false;
    update();
    return isSuccess;
  }
}