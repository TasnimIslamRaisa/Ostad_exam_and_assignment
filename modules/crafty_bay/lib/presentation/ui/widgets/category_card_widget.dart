import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/category_model.dart';
import '../../controller/product_list_by_category_controller.dart';
import '../screens/product_list_screen.dart';
import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.find<ProductListByCategoryController>()
            .getProductListByCategory(categoryModel.id!);
        Get.to(() => ProductListScreen(category: categoryModel));
                },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            //color: AppColors.themeColor,
            child:Image.network(categoryModel.categoryImg ?? ' ',width: 48,height: 48,) ,
              //size: 48,
            ),

          const SizedBox(height: 4),
          Text(
            categoryModel.categoryName?? "Unknown",
            style: const TextStyle(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }
}