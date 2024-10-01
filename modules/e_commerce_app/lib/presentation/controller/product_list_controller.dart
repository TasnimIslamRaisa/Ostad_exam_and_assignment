import 'package:e_commers_app/data/models/category_model.dart';
import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/models/product_list_model.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';

class ProductListController extends GetxController {
  bool _inprogress = false;
  bool get inprogress =>_inprogress;

  String? _errorMsg;
  List<ProductModel> _productList=[];
  String? get errorMsg=>_errorMsg;
  List<ProductModel>  get productList=>_productList;

  Future<bool> getProductList() async {
    bool isSuccess =false;
    _inprogress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.productListUrl);
    if(response.isSuccess){
      _errorMsg=null;
      _productList = ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess=true;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}
