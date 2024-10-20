
import 'package:crafty_bay/data/models/slider_list_model.dart';

class ListProductSliderModel {
  String? _msg;
  List<SliderData>? _sliderdata;

  ListProductSliderModel({String? msg, List<SliderData>? sliderdata}) {
    if (msg != null) {
      this._msg = msg;
    }
    if (sliderdata != null) {
      this._sliderdata = sliderdata;
    }
  }

  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;
  List<SliderData>? get data => _sliderdata;
  set data(List<SliderData>? data) => _sliderdata = data;

  ListProductSliderModel.fromJson(Map<String, dynamic> json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _sliderdata = <SliderData>[];
      json['data'].forEach((v) {
        _sliderdata!.add(new SliderData.fromJson(v));
      });
    }
  }

/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this._msg;
    if (this._sliderdata != null) {
      data['data'] = this._sliderdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}