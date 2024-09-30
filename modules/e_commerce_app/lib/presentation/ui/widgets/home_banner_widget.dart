
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commers_app/presentation/controller/slider_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import 'centered_circularpogress.dart';

class HomeBannerWidget extends StatelessWidget {
  HomeBannerWidget({
    super.key,
  });

  final ValueNotifier<int> _selectedIndex=ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(
      builder: (sliderListController) {
        return Visibility(
          visible: sliderListController.inprogress==false,
          replacement: const SizedBox(
            height: 200,
            child: CenteredCircularpogress(),
          ),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 200.0,
                  onPageChanged: (index,reason){
                      _selectedIndex.value=index;
                  }
                ),
                items: sliderListController.sliders.map((slider) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: AppColors.themeColor,
                          ),
                          child: Text('text $slider', style: TextStyle(fontSize: 16.0),)
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 8,),
              ValueListenableBuilder(
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
                              color: _selectedIndex.value==i? AppColors.themeColor : null
                          ),
                        ),
                    ],
                  );
                }
              ),
            ],
          ),
        );
      }
    );
  }
}