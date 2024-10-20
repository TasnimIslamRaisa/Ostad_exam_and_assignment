import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../../controller/category_list_controller.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/centered_circularpogress.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  void backToHome(){
    Get.find<BottomNavbarController>().backToHome();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Categories'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            //Get.find<CategoryListController>().getCategoryList();
            Get.find<CategoryListController>().categoryList.clear();
            await Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              // Check if data is loading
              if (categoryListController.inprogress) {
                return const CenteredCircularpogress();
              }
              // Check if there is an error message
              else if (categoryListController.errorMsg != null) {
                return Center(
                  child: Text(categoryListController.errorMsg!),
                );
              }

              // Build the GridView if data is available and no error
              return GridView.builder(
                itemCount: categoryListController.categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryModel: categoryListController.categoryList[index],
                  );
                },
              );
            },
          )

        ),
      ),
    );
  }
}
