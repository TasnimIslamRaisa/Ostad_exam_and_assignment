import 'package:e_commers_app/presentation/controller/bottom_nav_bar_controller.dart';
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
              buildSection('Popular Products', const HorizontalProductListView()),   // Reused for Popular Products
              const SizedBox(height: 8),
              buildSection('Special Products', const HorizontalProductListView()),   // Reused for Special Products
              const SizedBox(height: 8),
              buildSection('New Products', const HorizontalProductListView()),       // Reused for New Products
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
       // Get.to(()=>const CategoryListScreen());
        Get.find<BottomNavbarController>().selectCategoryTab();
      }),
      const SizedBox(height: 18),
      const SizedBox(
        height: 110,
        child: CategoryListViewWidget(),
      ),
    ],
  );
}

Widget buildSection(String title, Widget listView) {
  return Column(
    children: [
      SectionHeader(header: title, onTap: () {
        Get.find<BottomNavbarController>().selectCategoryTab();
      }),
      const SizedBox(height: 18),
      SizedBox(child: listView),
    ],
  );
}


