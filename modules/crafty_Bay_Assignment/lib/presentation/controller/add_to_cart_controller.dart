import 'dart:ui';
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'auth_controller.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  String? _errorMsg;
  String? get errorMsg => _errorMsg;
  bool get inProgess => _inProgress;

  Future<bool> addToCart(int productId,String color,String size,int quantity) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(
        url: Urls.createCartListUrl,
        body: {
          "product_id":productId,
          "color":color,
          "size":size,
          "qty":quantity
        }, token: AuthController.accessToken
    );
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      _errorMsg = null;
      isSuccess = true;
    } else {
      _errorMsg = response.errorMsg;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
