
import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/models/product_list_model.dart';
import '../../data/models/product_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class SpecialProductListController extends GetxController {
  bool _inProgress = false;

  bool get inprogress =>_inProgress;

  String? _errorMsg;

  List<ProductModel> _productList=[];

  String? get errorMsg=>_errorMsg;

  List<ProductModel>  get productList=>_productList;

  Future<bool> getSpecialProductList() async {

    bool isSuccess =false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.productListByRemark('special'));

    if(response.isSuccess){
      _errorMsg=null;
      _productList = ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess=true;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inProgress=false;
    update();
    return isSuccess;
  }
}