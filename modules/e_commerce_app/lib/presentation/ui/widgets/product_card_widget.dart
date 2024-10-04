import 'package:e_commers_app/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;

  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(product: product));
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Section
              Container(
                width: 160,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(product.image ?? AssetsPath.productImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Product Info Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? "Unknown Product",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      //overflow: TextOverflow.ellipsis, // To handle long text
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded( // To avoid overflow for long prices
                          child: Text(
                            '\$${product.price ?? "N/A"}',
                            style: const TextStyle(
                              color: AppColors.themeColor,
                              fontSize: 12
                            ),
                            //overflow: TextOverflow.ellipsis, // To handle long prices
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 16,
                            ),
                            Text('${product.star ?? 0.0}'),
                          ],
                        ),
                        // Favorite Button
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: AppColors.themeColor,
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.favorite_border_sharp,
                              color: Colors.white,
                              size: 16,
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
      ),
    );
  }
}
