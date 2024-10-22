import 'package:e_commers_app/data/models/product_model.dart';
import 'package:e_commers_app/data/models/wish_list_model.dart';

class WishListProductModel {
  String? msg;
  List<WishListModel>? wishListData;

  WishListProductModel({this.msg, this.wishListData});

  WishListProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishListData = <WishListModel>[];
      json['data'].forEach((v) {
        wishListData!.add(new WishListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.wishListData != null) {
      data['data'] = this.wishListData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


