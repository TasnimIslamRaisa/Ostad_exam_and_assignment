import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AssetsPath.productImg,
              height: 80,
              width: 80,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 16,),
            Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title of Product',style: Theme.of(context).textTheme.titleMedium,),
                            const Wrap(
                              spacing: 8,
                              children: [
                                Text('Color : Red'),
                                Text("Size : XL"),
                              ],
                            ),
                            const Text('\$100',style: TextStyle(color: AppColors.themeColor,)),
                          ],
                        )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(onPressed: (){}, icon:const Icon(Icons.delete)),
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