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

  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        visible: sliderListController.inprogress == false,
        replacement: const SizedBox(
          height: 200,
          child: CenteredCircularpogress(),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    _selectedIndex.value = index;
                  }),
              items: sliderListController.sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Placeholder(
                            fallbackWidth: 120,
                            fallbackHeight: 100,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  slider.price ?? " ",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: AppColors.themeColor,
                                      ),
                                      child: const Text("Buy Now")),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 8,
            ),
            ValueListenableBuilder(
                valueListenable: _selectedIndex,
                builder: (context, currentIndex, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < sliderListController.sliders.length;
                          i++)
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey),
                              color: _selectedIndex.value == i
                                  ? AppColors.themeColor
                                  : null),
                        ),
                    ],
                  );
                }),
          ],
        ),
      );
    });
  }
}
