import 'cart_model.dart';

class CartListModel {
  String? msg;
  List<CartModel>? cartListData;

  CartListModel({this.msg, this.cartListData});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    cartListData = List<CartModel>.from(
        json['data'].map((item) => CartModel.fromJson(item)));
  }


}

