import 'package:e_commers_app/data/models/product_model.dart';

class ProductDetailsModel {
  int? id;
  String? img1;
  String? img2;
  String? img3;
  String? img4;
  String? des;
  String? color;
  String? size;
  int? productId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  ProductDetailsModel(
      {this.id,
        this.img1,
        this.img2,
        this.img3,
        this.img4,
        this.des,
        this.color,
        this.size,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.product});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
    des = json['des'];
    color = json['color'];
    size = json['size'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img1'] = this.img1;
    data['img2'] = this.img2;
    data['img3'] = this.img3;
    data['img4'] = this.img4;
    data['des'] = this.des;
    data['color'] = this.color;
    data['size'] = this.size;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}