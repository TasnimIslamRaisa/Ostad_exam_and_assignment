import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/category_model.dart';  // Assuming CategoryModel is imported correctly
import '../../controller/bottom_nav_bar_controller.dart';
import '../../controller/product_list_by_category_contrller.dart';
import '../../controller/product_list_controller.dart'; // Assuming the controller is correct

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final CategoryModel category; // Passing the entire CategoryModel object

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch product list by category ID
    Get.find<ProductListByCategoryController>()
        .getProductListByCategory(widget.category.id!); // Assuming category.id is not null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.categoryName ?? ''), // Display category name
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavbarController>().backToHome(); // Navigate back to home
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetBuilder<ProductListByCategoryController>(
          builder: (productListByCategoryController) {
            if (productListByCategoryController.inProgress) {
              // Display loading indicator while products are being fetched
              return const Center(child: CircularProgressIndicator());
            }

            if (productListByCategoryController.errorMessage != null) {
              // Display error message if there's an error fetching products
              return Center(
                child: Text(productListByCategoryController.errorMessage!),
              );
            }

            if (productListByCategoryController.productList.isEmpty) {
              // Display message if there are no products
              return const Center(
                child: Text('No products available'),
              );
            }

            // Display the product list in a GridView
            return GridView.builder(
              itemCount: productListByCategoryController.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.70,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                // Pass the product to ProductCardWidget for display
                return ProductCardWidget(
                  product: productListByCategoryController.productList[index],
                );
              },
            );
          }),
    );
  }
}
