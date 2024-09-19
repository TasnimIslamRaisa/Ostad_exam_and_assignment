import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/card_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,});

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
            leading: IconButton(onPressed: (){
              backToHome();
            }, icon: Icon(Icons.arrow_back_ios)),
            title: Text('Cart'),
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    itemCount: 15,
                      itemBuilder: (context,index){
                      return  const CardItemWidget();
                      },


                  )),
              PriceAndCartSection(),
            ],
          ),
        ));
  }
}





Widget PriceAndCartSection() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.themeColor.withOpacity(0.18),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(8),
        topLeft:  Radius.circular(8),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price',style: TextStyle(fontSize: 16),),
              Text('\$1,000',style:TextStyle(
                  color: AppColors.themeColor,fontSize: 20
              )),
            ],
          ),
          SizedBox(
              width: 140,
              child: ElevatedButton(onPressed: (){}, child: const Text('Checkout')))
        ],
      ),
    ),
  );
}