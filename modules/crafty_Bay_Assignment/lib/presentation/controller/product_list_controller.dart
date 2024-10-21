import '../../data/models/network_response.dart';
import '../../data/models/product_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';

class ProductListController extends GetxController {
  bool _popularProductInprogress = false;
  bool _newProductInprogress = false;
  bool _specialProductInprogress = false;
  bool get popularProductInprogress => _popularProductInprogress;
  bool get newProductInprogress => _newProductInprogress;
  bool get specialProductInprogress => _specialProductInprogress;

  String? _errorMsg;

  List<ProductModel> _popularProductList = [];
  List<ProductModel> _newProductList = [];
  List<ProductModel> _specialProductList = [];

  String? get errorMsg => _errorMsg;

  List<ProductModel> get propularproductList => _popularProductList;
  List<ProductModel> get newproductList => _newProductList;
  List<ProductModel> get specialproductList => _specialProductList;

  Future<bool> getProductByRemark(String remark) async {
    bool isSuccess = false;
    // Handle loading state dynamically
    if (remark == "popular") {
      _popularProductInprogress = true;
    } else if (remark == "new") {
      _newProductInprogress = true;
    } else if (remark == "special") {
      _specialProductInprogress = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productListByRemark(remark));

    if (response.isSuccess) {
      _errorMsg = null;
      List<ProductModel> fetchedProducts =
          ProductListModel.fromJson(response.responseData).productList ?? [];

      // Assign products based on remark
      if (remark == "popular") {
        _popularProductList = fetchedProducts;
      } else if (remark == "new") {
        _newProductList = fetchedProducts;
      } else if (remark == "special") {
        _specialProductList = fetchedProducts;
      }

      isSuccess = true;
    } else {
      _errorMsg = response.errorMsg;
    }

    // Update loading state
    if (remark == "popular") {
      _popularProductInprogress = false;
    } else if (remark == "new") {
      _newProductInprogress = false;
    } else if (remark == "special") {
      _specialProductInprogress = false;
    }
    update();
    return isSuccess;
  }
}
