import 'package:e_commers_app/data/models/category_model.dart';
import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/models/product_list_model.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';

class NewProductListController extends GetxController {
  bool _inProgress = false;

  bool get inprogress =>_inProgress;

  String? _errorMsg;

  List<ProductModel> _productList=[];

  String? get errorMsg=>_errorMsg;

  List<ProductModel>  get productList=>_productList;

  Future<bool> getNewProductList() async {

    bool isSuccess =false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.productListByRemark('new'));

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