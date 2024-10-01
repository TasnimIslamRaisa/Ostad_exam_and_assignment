import 'package:e_commers_app/presentation/controller/category_list_controller.dart';
import 'package:e_commers_app/presentation/ui/widgets/centered_circularpogress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../widgets/category_card_widget.dart';

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
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              return GridView.builder(
                itemCount: categoryListController.categoryList.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,childAspectRatio:0.75,),
                itemBuilder: (BuildContext context, int index) {
                  if(categoryListController.inprogress){
                    return const CenteredCircularpogress();
                  } else if(categoryListController.errorMsg!= null){
                    return Center(
                      child: Text(categoryListController.errorMsg !),
                    );
                  }
                  return CategoryCard(
                  categoryModel: categoryListController.categoryList[index],
                );
                },
              );
            }
          ),
        ),
      ),
    );
  }
}
