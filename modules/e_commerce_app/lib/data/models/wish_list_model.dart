import 'package:e_commers_app/data/models/product_model.dart';

class WishListModel {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  WishListModel(
      {this.id,
        this.productId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.product});

  WishListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}