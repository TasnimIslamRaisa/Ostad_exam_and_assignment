import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/category_card_widget.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
          Get.find<BottomNavbarController>().backToHome();
        },
        icon: Icons.home,
        ),
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        itemCount: 25,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
        return const CategoryCard();
        },
      ),
    );
  }
}
