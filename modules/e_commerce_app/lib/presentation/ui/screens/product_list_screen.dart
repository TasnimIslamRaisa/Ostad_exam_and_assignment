import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../../controller/product_list_controller.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final productListController = Get.find<ProductListController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavbarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListController>(
          builder: (controller) {
            // Determine the product list and loading state based on the category
            List<ProductModel> productList;
            bool inprogress;

            if (categoryName == "Popular Products") {
              productList = controller.propularproductList;
              inprogress = controller.popularProductInprogress;
            } else if (categoryName == "New Products") {
              productList = controller.newproductList;
              inprogress = controller.newProductInprogress;
            } else if (categoryName == "Special Products") {
              productList = controller.specialproductList;
              inprogress = controller.specialProductInprogress;
            } else {
              productList = [];
              inprogress = false;
            }
            if (inprogress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (productList.isEmpty) {
              return const Center(
                child: Text("No products available"),
              );
            }

            return GridView.builder(
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.70,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                // Get product at the current index
                ProductModel product = productList[index];

                // Pass the product to the ProductCardWidget
                return ProductCardWidget(product: product);
              },
            );
          },
        ),
      ),
    );
  }
}
