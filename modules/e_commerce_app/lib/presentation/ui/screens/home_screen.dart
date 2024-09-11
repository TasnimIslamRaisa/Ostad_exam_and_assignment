import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/assets_path.dart';
import '../widgets/home_banner_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/section_header_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SearchWidget(
              searchController: TextEditingController(),
            ),
            const SizedBox(height: 18),
            HomeBannerWidget(),
            const SizedBox(height: 18),
            buildCategoriesSection(),
            const SizedBox(height: 18),
            buildPopularProductsSection(), // Using popular products section
          ],
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
        onTap: () {},
      ),
      const SizedBox(height: 18),
      SizedBox(child: buildCategoriesSectionBuilder()),

    ],
  );
}
Widget buildCategoriesSectionBuilder(){
  return SizedBox(
    height: 110,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.computer,
                color: AppColors.themeColor,
                size: 48,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Electronics",
              style: TextStyle(color: AppColors.themeColor),
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    ),
  );
}

Widget buildPopularProductsSection() {
  return Column(
    children: [
      SectionHeader(
        header: 'Popular Products',
        onTap: () {},
      ),
      const SizedBox(height: 18),
      SizedBox(child: buildPopularProductsSectionBuilder()),
    ],
  );
}

Widget buildPopularProductsSectionBuilder() {
  return SizedBox(
    height: 180,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          child: SizedBox(
          width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 100,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor.withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(AssetsPath.productImg),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const Text("Product Name"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('\$100',style: TextStyle(color: AppColors.themeColor),),
                                Wrap(
                                  children: [
                                    Icon(Icons.star,color: Colors.yellow.shade700,),
                                    const Text('4.8'),
                                  ],
                                ),
                                const Card(
                                  borderOnForeground: true,
                                  color:AppColors.themeColor,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(Icons.favorite_border_sharp,
                                        color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    ),
  );
}
