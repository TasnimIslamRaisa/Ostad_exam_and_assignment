import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
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
        //title: const Text('title'),
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SearchWidget(
              searchController: TextEditingController(),
            ),
            const SizedBox(
              height: 18,
            ),
            HomeBannerWidget(),
            const SizedBox(
              height: 18,
            ),
            buildCategoriesSection(),
            const SizedBox(
              height: 8,
            ),
            buildProductSection(),



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
      const SizedBox(
        height: 18,
      ),
       SizedBox(
    height: 110,
    child: ListView.separated(
    scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Electronics",
              style: TextStyle(color: AppColors.themeColor),
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(
        width: 8,
      ),
    ),
  ),
    ],
  );
}


Widget buildProductSection() {
  return Column(
    children: [
      SectionHeader(
        header: 'Popular',
        onTap: () {},
      ),
      const SizedBox(height: 8),
      SizedBox(
    height: 120,
    child: ListView.separated(
    scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
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

          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(
        width: 8,
      ),
    ),
  )
    ],
  );
}


