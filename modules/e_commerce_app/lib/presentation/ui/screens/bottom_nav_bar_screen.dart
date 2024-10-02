import 'package:e_commers_app/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:e_commers_app/presentation/controller/new_product_list_controller.dart';
import 'package:e_commers_app/presentation/controller/product_list_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/cart_screen.dart';
import 'package:e_commers_app/presentation/ui/screens/category_list_screen.dart';
import 'package:e_commers_app/presentation/ui/screens/home_screen.dart';
import 'package:e_commers_app/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/category_list_controller.dart';
import '../../controller/slider_list_controller.dart';
import '../../controller/special_product_list_controller.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final BottomNavbarController _bottomNavbarController=Get.find<BottomNavbarController>();
  final List<Widget> _screens=const [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  //to reduce api call again and again we used this here instead of homescreen
  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliderList();
    Get.find<CategoryListController>().getCategoryList();
    //
    Get.find<SpecialProductListController>().getSpecialProductList();
    Get.find<NewProductListController>().getNewProductList();
    //
    Get.find<ProductListController>().getProductByRemark("popular");
    Get.find<ProductListController>().getProductByRemark("new");
    Get.find<ProductListController>().getProductByRemark("special");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(
      builder: (_) {
        return Scaffold(
          body: _screens[_bottomNavbarController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: _bottomNavbarController.selectedIndex,
              onDestinationSelected: _bottomNavbarController.changeIndex,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                NavigationDestination(icon: Icon(Icons.favorite_border_sharp), label: 'WishList'),
              ],
          ),
        );
      }
    );
  }
}
