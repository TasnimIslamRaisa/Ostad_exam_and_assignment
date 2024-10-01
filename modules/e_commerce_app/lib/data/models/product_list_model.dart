import 'package:e_commers_app/data/models/category_model.dart';
import 'package:e_commers_app/data/models/product_model.dart';

import 'brand_model.dart';

class ProductListModel {
  String? msg;
  List<ProductModel>? data;

  ProductListModel({this.msg, this.data});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


