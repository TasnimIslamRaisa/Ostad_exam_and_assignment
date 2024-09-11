import 'package:e_commers_app/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commers_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return const ProductListScreen(categoryName: 'Cart List',);
  }
}