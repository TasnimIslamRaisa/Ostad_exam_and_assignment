import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/models/wish_list_model.dart';
import 'package:e_commers_app/data/models/wish_list_product_model.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:e_commers_app/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _inprogress = false;
  String? _errorMsg;
  List<WishListModel> _wishtList=[];

  bool get inprogress =>_inprogress;
  String? get errorMsg=>_errorMsg;
  List<WishListModel>  get wishtList=>_wishtList;

  Future<bool> getWishtList() async {
    bool isSuccess =false;
    _inprogress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.productWishList,token: AuthController.accessToken);
    if(response.isSuccess){
      _errorMsg=null;
      _wishtList = WishListProductModel.fromJson(response.responseData).wishListData ?? [];
      isSuccess=true;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}
