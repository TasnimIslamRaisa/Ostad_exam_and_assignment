import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CounterController{

  RxInt _count=0.obs ;
  RxInt get count=> _count;

  void incrementCount(){
    _count++;
  }
  void decrementCount(){
    _count--;
  }
}