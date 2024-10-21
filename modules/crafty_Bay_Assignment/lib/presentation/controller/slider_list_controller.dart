import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import 'package:get/get.dart';

import '../../data/models/slider_list_model.dart';

class SliderListController extends GetxController {
  bool _inprogress = false;
  bool get inprogress =>_inprogress;

  String? _errorMsg;
  List<SliderData> _sliderList=[];
  String? get errorMsg=>_errorMsg;
  List<SliderData>  get sliders=>_sliderList;

  Future<bool> getSliderList() async {
    bool isSuccess =false;
    _inprogress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.sliderUrl);
    if(response.isSuccess){
      _errorMsg=null;
      _sliderList = SliderData.fromJsonList(response.responseData['data'] ?? []);
      isSuccess=true;
    } else {
      _errorMsg=response.errorMsg;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }
}

