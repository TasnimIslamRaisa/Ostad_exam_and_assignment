import 'package:e_commers_app/presentation/controller/bottom_nav_bar_controller.dart';
import 'package:e_commers_app/presentation/controller/category_list_controller.dart';
import 'package:e_commers_app/presentation/controller/product_list_controller.dart'; // Add this import
import 'package:e_commers_app/presentation/ui/widgets/centered_circularpogress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/assets_path.dart';
import '../widgets/category_listView_widget.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/horizontal_product_listView_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/section_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductListController productListController = Get.find<ProductListController>();

  @override
  void initState() {
    super.initState();
    // Fetch product lists
    productListController.getProductList(); // You can call different methods to fetch different types of products
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
      SizedBox(
        height: 110,
        child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              return Visibility(
                  visible: !categoryListController.inprogress,
                  replacement: const CenteredCircularpogress(),
                  child: CategoryListViewWidget(
                    categoryList: categoryListController.categoryList,
                  )
              );
            }
        ), // ListView for Categories
      ),
    ],
  );
}

Widget buildPopularProductsSection() {
  return Column(
    children: [
      SectionHeader(header: 'Popular Products', onTap: () {
        Get.find<BottomNavbarController>().selectProductTab();
      }),
      const SizedBox(height: 18),
      GetBuilder<ProductListController>(
        builder: (productListController) {
          if (productListController.inprogress) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 220,
            child: HorizontalProductListView(products: productListController.productList), // Pass popular products here
          );
        },
      ),
    ],
  );
}

Widget buildSpecialProductsSection() {
  return Column(
    children: [
      SectionHeader(header: 'Special Products', onTap: () {
        Get.find<BottomNavbarController>().selectProductTab();
      }),
      const SizedBox(height: 18),
      GetBuilder<ProductListController>(
        builder: (productListController) {
          if (productListController.inprogress) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 220,
            child: HorizontalProductListView(products: productListController.productList), // Pass special products here
          );
        },
      ),
    ],
  );
}

Widget buildNewProductsSection() {
  return Column(
    children: [
      SectionHeader(header: 'New Products', onTap: () {
        Get.find<BottomNavbarController>().selectProductTab();
      }),
      const SizedBox(height: 18),
      GetBuilder<ProductListController>(
        builder: (productListController) {
          if (productListController.inprogress) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 220,
            child: HorizontalProductListView(products: productListController.productList), // Pass new products here
          );
        },
      ),
    ],
  );
}
