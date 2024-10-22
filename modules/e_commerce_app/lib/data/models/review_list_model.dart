import 'package:e_commers_app/data/models/review_list_data_model.dart';

class ReviewListModel {
  String? msg;
  List<ReviewListData>? reviewListData;

  ReviewListModel({this.msg, this.reviewListData});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviewListData = <ReviewListData>[];
      json['data'].forEach((v) {
        reviewListData!.add( ReviewListData.fromJson(v));
      });
    }
  }


}
