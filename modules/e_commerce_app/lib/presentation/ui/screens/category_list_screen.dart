import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../widgets/category_card_widget.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

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
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Categories'),
        ),
        body: GridView.builder(
          itemCount: 25,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio:0.75,),
          itemBuilder: (BuildContext context, int index) {
          return const CategoryCard();
          },
        ),
      ),
    );
  }
}
