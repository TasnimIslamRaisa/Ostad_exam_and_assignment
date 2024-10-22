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
      this.updatedAt,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0');
    userId = json['user_id']?.toString();
    productId = json['product_id'] is int ? json['product_id'] : int.tryParse(json['product_id']?.toString() ?? '0');
    color = json['color']?.toString();
    size = json['size']?.toString();
    qty = json['qty'] is int ? json['qty'] : int.tryParse(json['qty']?.toString() ?? '0');
    price = json['price'] is int ? json['price'] : int.tryParse(json['price']?.toString() ?? '0');
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    product = json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }


/*  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }*/
}
