import 'package:e_commers_app/data/models/product_details_model.dart';

class ProductDetailsByIdModel {
  String? msg;
  List<ProductDetailsModel>? data;

  ProductDetailsByIdModel({this.msg, this.data});

  ProductDetailsByIdModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        data!.add(new ProductDetailsModel.fromJson(v));
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
