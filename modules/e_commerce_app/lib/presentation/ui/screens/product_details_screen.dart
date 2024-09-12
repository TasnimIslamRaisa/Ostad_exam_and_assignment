import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:e_commers_app/presentation/ui/widgets/product_image_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
           // backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Product Details'),
      ),
      body:Column(

        children: [
          ProductImgSliderWidget(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Nike Shoe 2024 latest model - New Year Special',style: Theme.of(context).textTheme.titleMedium,)),
                    ItemCount(
                      color: AppColors.themeColor,
                      initialValue: 1,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      onChanged: (value) {
                        // Handle counter value changes
                        print('Selected value: $value');
                      },
                    ),

                  ],
                ),
                const SizedBox(height: 4,),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 12,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                          size: 16,
                        ),
                        const Text('4.8'),
                      ],
                    ),
                    const Text(
                      'Reviews',
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w600,
                      ),
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
                const SizedBox(height: 4,),
                ColorPicker(
                  colors: const[
                    Colors.black,
                    Colors.blue,
                    Colors.pink,
                    Colors.purpleAccent,
                  ],
                  onColorSelected: (Color ) {  },),

              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
