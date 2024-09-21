import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

class CounterController extends GetxController{

  RxInt _count=0.obs ;
  RxInt get count=> _count;

  final storage=GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Load counter value from GetStorage when controller is initialized
    loadCounterValue();
  }

  void incrementCount(){
    _count++;
    saveCountValue();
  }
  void decrementCount(){
    _count--;
    saveCountValue();
  }

  void saveCountValue(){
    storage.write('counterValue', _count.value);
  }
  void loadCounterValue(){
    _count.value=storage.read('counterValue') ?? 0 ;
  }
}