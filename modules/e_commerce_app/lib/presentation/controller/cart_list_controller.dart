import 'package:e_commers_app/data/models/cart_list_model.dart';
import 'package:e_commers_app/data/models/cart_model.dart';
import 'package:e_commers_app/data/models/category_model.dart';
import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:e_commers_app/presentation/controller/auth_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/email_varification_screen.dart';
import 'package:get/get.dart';
import '../../data/models/category_list_model.dart';

class CartListController extends GetxController {
  bool _inprogress = false;
  String? _errorMsg;
  List<CartModel> _cartList=[];

  bool get inprogress =>_inprogress;
  String? get errorMsg=>_errorMsg;
  List<CartModel>  get cartList=>_cartList;

  Future<bool> getCartList() async {
    bool isSuccess =false;
    _inprogress = true;
    update();

    final String? token = await Get.find<AuthController>().getAccessToken();
    if (token == null) {
      _errorMsg = "User is not authenticated. Please log in.";
      update();
      Get.to(() => const EmailVarificationScreen()); // Redirect to login if token is null
      return false;
    }

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.cartListUrl,token:token);
    if(response.isSuccess){
      _errorMsg=null;
      _cartList = CartListModel.fromJson(response.responseData).cartListData ?? [];
      isSuccess=true;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}