import 'package:e_commers_app/data/models/product_model.dart';

class CartModel {
  int? id;
  String? userId;
  int? productId;
  String? color;
  String? size;
  int? qty;
  int? price;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  CartModel(
      {this.id,
        this.userId,
        this.productId,
        this.color,
        this.size,
        this.qty,
        this.price,
        this.createdAt,
        this.updatedAt});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['color'] = this.color;
    data['size'] = this.size;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}