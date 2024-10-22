import 'package:e_commers_app/data/models/product_model.dart';
import 'package:e_commers_app/data/models/wish_list_model.dart';
import 'package:e_commers_app/presentation/controller/wish_list_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_nav_bar_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key}); 

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  WishListController wishListController =Get.find<WishListController>();
  @override
  void initState() {
    super.initState();
    // Fetch product list by category ID
    wishListController.getWishtList();
  }

  void backToHome(){
    Get.find<BottomNavbarController>().backToHome();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wish List"), // Display category name
          leading: IconButton(
            onPressed: () {
              Get.off(()=>const BottomNavBarScreen());
              //Get.find<BottomNavbarController>().backToHome(); // Navigate back to home
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<WishListController>(
            builder: (wishListController) {
              if (wishListController.inprogress) {
                // Display loading indicator while products are being fetched
                return const Center(child: CircularProgressIndicator());
              }
      
              if (wishListController.errorMsg != null) {
                // Display error message if there's an error fetching products
                return Center(
                  child: Text(wishListController.errorMsg!),
                );
              }
      
              if (wishListController.wishtList.isEmpty) {
                // Display message if there are no products
                return const Center(
                  child: Text('No products available'),
                );
              }
              // Display the product list in a GridView
              return GridView.builder(
                itemCount: wishListController.wishtList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.62,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  WishListModel wishListModel=wishListController.wishtList[index];
                  ProductModel? product = wishListModel.product; // Extract the product
                  if(product!=null){
                    return ProductCardWidget(
                        product:product,
                      );
                  }
                  return const Center(child:  Text("You Don't Have A Wish List"));
                },
              );
            }),
      ),
    );
  }
}
