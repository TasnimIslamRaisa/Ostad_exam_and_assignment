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
import '../../controller/popular_product_list_controller.dart';
import '../../controller/product_list_by_category_controller.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_)
    {
      Get.find<SliderListController>().getSliderList();
      Get.find<CategoryListController>().getCategoryList();
      Get.find<PopularProductListController>().getPopularProductList();
      Get.find<NewProductListController>().getNewProductList();
      Get.find<SpecialProductListController>().getSpecialProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(
      builder: (_) {
        // Ensure the selectedIndex is within the bounds of the _screens list
        if (_bottomNavbarController.selectedIndex < 0 ||
            _bottomNavbarController.selectedIndex >= _screens.length) {
          return const Center(
            child: Text('Error: Invalid Index'),
          );
        }
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
