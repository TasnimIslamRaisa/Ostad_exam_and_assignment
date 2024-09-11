import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'category_card_widget.dart';

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return CategoryCard();
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}

