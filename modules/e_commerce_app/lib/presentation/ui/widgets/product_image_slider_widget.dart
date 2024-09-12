
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/assets_path.dart';

class ProductImgSliderWidget extends StatelessWidget {
  ProductImgSliderWidget({
    super.key,
  });

  final ValueNotifier<int> _selectedIndex=ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 220.0,
              onPageChanged: (index,reason){
                _selectedIndex.value=index;
              },
            viewportFraction: 1,

          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  //  width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(AssetsPath.productImg)),
                      color: Colors.grey.shade100
                    ),
                   // child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable:_selectedIndex,
              builder: (context,currentIndex,_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0;i<5;i++)
                      Container(
                        width: 12,
                        height: 12,
                        margin:const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.grey),
                            color: _selectedIndex.value==i? AppColors.themeColor : Colors.white
                        ),
                      ),
                  ],
                );
              }
          ),
        ),
      ],
    );
  }
}