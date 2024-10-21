import 'package:crafty_bay_assignment/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';

class HorizontalProductListView extends StatelessWidget {
  final List<ProductModel> products; // Accept a list of products

  const HorizontalProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          // Get product at the current index
          ProductModel product = products[index];

          // Pass the product to the ProductCardWidget
          return ProductCardWidget(product: product);
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      ),
    );
  }
}
