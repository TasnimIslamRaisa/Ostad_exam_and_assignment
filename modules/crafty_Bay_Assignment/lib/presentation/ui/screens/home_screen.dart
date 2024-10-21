import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../../controller/category_list_controller.dart';
import '../../controller/new_product_list_controller.dart';
import '../../controller/popular_product_list_controller.dart';
import '../../controller/special_product_list_controller.dart';
import '../utils/assets_path.dart';
import '../widgets/category_listView_widget.dart';
import '../widgets/centered_circularpogress.dart';
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
  @override
  void initState() {
    super.initState();
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
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active)),
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
              buildPopularProductsSection(), // Popular Products
              const SizedBox(height: 8),
              buildSpecialProductsSection(), // Special Products
              const SizedBox(height: 8),
              buildNewProductsSection(), // New Products
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
      SectionHeader(
          header: 'Categories',
          onTap: () {
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
              ));
        }), // ListView for Categories
      ),
    ],
  );
}

Widget buildPopularProductsSection() {
  return Column(
    children: [
      SectionHeader(
          header: 'Popular Products',
          onTap: () {
            Get.find<BottomNavbarController>().selectProductTab();
          }),
      const SizedBox(height: 18),
      GetBuilder<PopularProductListController>(
        builder: (popularProductListController) {
          if (popularProductListController.inprogress) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 220,
            child: HorizontalProductListView(
                products: popularProductListController
                    .productList), // Pass popular products here
          );
        },
      ),
    ],
  );
}

Widget buildSpecialProductsSection() {
  return Column(
    children: [
      SectionHeader(
          header: 'Special Products',
          onTap: () {
            Get.find<BottomNavbarController>().selectProductTab();
          }),
      const SizedBox(height: 18),
      GetBuilder<SpecialProductListController>(
        builder: (specialProductListController) {
          if (specialProductListController.inprogress) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 220,
            child: HorizontalProductListView(
                products: specialProductListController
                    .productList), // Pass special products here
          );
        },
      ),
    ],
  );
}

Widget buildNewProductsSection() {
  return Column(
    children: [
      SectionHeader(
          header: 'New Products',
          onTap: () {
            Get.find<BottomNavbarController>().selectProductTab();
          }),
      const SizedBox(height: 18),
      GetBuilder<NewProductListController>(
        builder: (newProductListController) {
          if (newProductListController.inprogress) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
            height: 220,
            child: HorizontalProductListView(
                products: newProductListController
                    .productList), // Pass new products here
          );
        },
      ),
    ],
  );
}
