import 'package:e_commers_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'category_card_widget.dart';

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({
    super.key, required this.categoryList
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categoryModel: categoryList[index],);
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}

