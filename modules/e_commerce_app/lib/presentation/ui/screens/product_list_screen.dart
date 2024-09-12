import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/bottom_nav_bar_controller.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(categoryName),
        leading: IconButton(
          onPressed: (){
            Get.find<BottomNavbarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 14,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
          childAspectRatio:0.75,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
          ),
          itemBuilder: (BuildContext context, int index) {
            return  const ProductCardWidget();
          },
        ),
      ),
    );
  }
}
