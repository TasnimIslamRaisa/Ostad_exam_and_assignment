import '../../presentation/controller/list_product_slider_controller.dart';

class ListProductSliderModel {
  String? _msg;
  List<Data>? _data;

  ListProductSliderModel({String? msg, List<Data>? data}) {
    if (msg != null) {
      this._msg = msg;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  ListProductSliderModel.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}