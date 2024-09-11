import 'package:e_commers_app/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>const ProductListScreen(categoryName: "Electronics"));
      },
      child: Column(
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
      ),
    );
  }
}