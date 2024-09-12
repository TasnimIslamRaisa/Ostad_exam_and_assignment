import 'package:e_commers_app/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/bottom_nav_bar_controller.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key,});
  void backToHome(){
    Get.find<BottomNavbarController>().backToHome();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        backToHome();
      },
        child: const ProductListScreen(categoryName: 'Wish List',));
  }
}