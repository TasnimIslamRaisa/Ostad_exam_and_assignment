import 'package:get/get.dart';
import '../../data/models/category_list_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class CategoryListController extends GetxController {
  bool _inprogress = false;
  String? _errorMsg;
  List<CategoryModel> _categoryList=[];

  bool get inprogress =>_inprogress;
  String? get errorMsg=>_errorMsg;
  List<CategoryModel>  get categoryList=>_categoryList;

  Future<bool> getCategoryList() async {
    bool isSuccess =false;
    _inprogress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.catListUrl);
    if(response.isSuccess){
      _errorMsg=null;
      _categoryList = CategoryListModel.fromJson(response.responseData).categoryList ?? [];
      isSuccess=true;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}
