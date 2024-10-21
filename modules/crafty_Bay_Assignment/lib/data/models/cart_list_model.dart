import 'cart_model.dart';

class CartListModel {
  String? msg;
  List<CartModel>? cartListData;

  CartListModel({this.msg, this.cartListData});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartListData = <CartModel>[];
      json['data'].forEach((v) {
        cartListData!.add(CartModel.fromJson(v));
      });
    }
     }
}

