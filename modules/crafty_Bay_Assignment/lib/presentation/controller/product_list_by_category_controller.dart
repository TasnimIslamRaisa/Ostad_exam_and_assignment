import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/models/product_list_model.dart';
import '../../data/models/product_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class ProductListByCategoryController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductListByCategory(int categoryId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.productListByCategory(categoryId),
    );

    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
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