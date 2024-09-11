import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return const ProductCardWidget();
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      ),
    );
  }
}