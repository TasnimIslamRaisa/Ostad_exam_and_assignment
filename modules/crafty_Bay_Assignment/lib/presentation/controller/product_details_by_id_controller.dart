import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/models/product_list_model.dart';
import '../../data/models/product_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class ProductDetailsByIdController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  ProductModel? _productModel;

  ProductModel? get product=>_productModel;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetailsById(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productDetailsByID(productId),
    );

    if (response.isSuccess) {
      _productModel =
          ProductListModel.fromJson(response.responseData).productList!.first;
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
