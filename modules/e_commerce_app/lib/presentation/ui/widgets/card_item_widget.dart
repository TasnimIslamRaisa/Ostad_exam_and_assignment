import 'package:e_commers_app/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class CardItemWidget extends StatefulWidget {
  final CartModel cartModel;
  const CardItemWidget({
    super.key,required this.cartModel,
  });

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  @override
  Widget build(BuildContext context) {
    int quantity=1;
    String imageUrl = widget.cartModel.product?.image?.isNotEmpty == true
        ? widget.cartModel.product!.image!
        : AssetsPath.productImg;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*Image.network(imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AssetsPath.productImg, height: 80, width: 80); // Fallback if network image fails
              },
            ),*/
            imageUrl.startsWith('http')
                ? Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AssetsPath.productImg, height: 80, width: 80); // Fallback if network image fails
              },
            )
                : Image.asset(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 16,),
            Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.cartModel.product?.title ?? "No title",style: Theme.of(context).textTheme.titleMedium,),
                            Wrap(
                              spacing: 8,
                              children: [
                                Text('Color : ${widget.cartModel.color}'),
                                Text("Size : ${widget.cartModel.size}"),
                              ],
                            ),
                            Text(widget.cartModel.price.toString(),style: const TextStyle(color: AppColors.themeColor,)),
                          ],
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(onPressed: (){}, icon:const Icon(Icons.delete)),
                            ItemCount(
                              color: AppColors.themeColor,
                              initialValue: quantity,
                              minValue: 1,
                              maxValue: 20,
                              decimalPlaces: 0,
                              onChanged: (value) {
                                // Handle counter value changes
                                print('Selected value: $value');
                                quantity= value.toInt();
                                setState(() {});
                              },
                            ),
                          ],
                        )
                      ],
                    ),

                  ],
                ))

          ],
        ),
      ),
    );
  }
}