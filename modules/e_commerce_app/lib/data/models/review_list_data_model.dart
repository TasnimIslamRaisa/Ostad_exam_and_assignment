
import 'Profile_model.dart';

class ReviewListData {
  int? id;
  String? description;
  int? rating;
  int? customerId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  ReviewListData(
      {this.id,
        this.description,
        this.rating,
        this.customerId,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.profile});

  ReviewListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    // Safely parse 'rating', convert from String to int if necessary
    rating = json['rating'] is String
        ? int.tryParse(json['rating']) // Try to convert String to int
        : json['rating']; // Use int directly if it's already an int

    customerId = json['customer_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
}