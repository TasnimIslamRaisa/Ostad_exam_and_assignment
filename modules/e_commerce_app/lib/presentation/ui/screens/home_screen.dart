import 'package:e_commers_app/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:e_commers_app/presentation/controller/slider_list_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/assets_path.dart';
import '../widgets/category_listView_widget.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/horizontal_product_listView_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/section_header_widget.dart';
import 'category_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<SliderListController>().getSliderList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AssetsPath.appLogoNav,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_active)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SearchWidget(searchController: TextEditingController()),
              const SizedBox(height: 18),
              HomeBannerWidget(),
              const SizedBox(height: 8),
              buildCategoriesSection(),
              const SizedBox(height: 8),
              buildPopularProductsSection(),    // Popular Products
              const SizedBox(height: 8),
              buildSpecialProductsSection(),    // Special Products
              const SizedBox(height: 8),
              buildNewProductsSection(),        // New Products
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCategoriesSection() {
  return Column(
    children: [
      SectionHeader(header: 'Categories', onTap: () {
        Get.find<BottomNavbarController>().selectCategoryTab();
      }),
      const SizedBox(height: 18),
      const SizedBox(
        height: 110,
        child: CategoryListViewWidget(), // ListView for Categories
      ),
    ],
  );
}

Widget buildPopularProductsSection() {
  return Column(
    children: [
      SectionHeader(header: 'Popular Products', onTap: () {
        // Navigate to the Popular Products screen or category
        Get.find<BottomNavbarController>().selectProductTab();
      }),
      const SizedBox(height: 18),
      const SizedBox(
        height: 220, // Set height based on your design needs
        child: HorizontalProductListView(),  // Widget for Popular Products
      ),
    ],
  );
}

Widget buildSpecialProductsSection() {
  return Column(
    children: [
      SectionHeader(header: 'Special Products', onTap: () {
        // Navigate to the Special Products screen or category
        Get.find<BottomNavbarController>().selectProductTab();
      }),
      const SizedBox(height: 18),
      const SizedBox(
        height: 220, // Set height based on your design needs
        child: HorizontalProductListView(),  // Widget for Special Products
      ),
    ],
  );
}

Widget buildNewProductsSection() {
  return Column(
    children: [
      SectionHeader(header: 'New Products', onTap: () {
        // Navigate to the New Products screen or category
        Get.find<BottomNavbarController>().selectProductTab();
      }),
      const SizedBox(height: 18),
      const SizedBox(
        height: 220, // Set height based on your design needs
        child: HorizontalProductListView(),  // Widget for New Products
      ),
    ],
  );
}
