import 'package:e_commers_app/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return const ProductListScreen(categoryName: 'Wish List',);
  }
}