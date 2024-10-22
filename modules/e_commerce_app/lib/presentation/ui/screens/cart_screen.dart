import 'package:e_commers_app/presentation/controller/cart_list_controller.dart';
import 'package:e_commers_app/presentation/ui/widgets/centered_circularpogress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_nav_bar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/card_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void backToHome() {
    Get.find<BottomNavbarController>().backToHome();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CartListController>().getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text('Cart'),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Get.find<CartListController>().getCartList();
          },
          child: GetBuilder<CartListController>(
            builder: (cartListController) {
              return Column(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: !cartListController.inprogress,
                      replacement:
                          const CenteredCircularpogress(), // Correct the typo here if needed
                      child: cartListController.cartList.isEmpty
                          ? const Center(
                              child: Text(
                                'Your Cart List Is Empty',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemCount: cartListController.cartList.length,
                              itemBuilder: (context, index) {
                                return CardItemWidget(
                                  cartModel: cartListController.cartList[index],
                                  onValueChanged: (totalPrice) {
                                    // Update total price logic if needed
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                  PriceAndCartSection(cartListController.totalPrice),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget PriceAndCartSection(int price) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.18),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 16),
                ),
                Text('\$$price',
                    style: const TextStyle(
                        color: AppColors.themeColor, fontSize: 20)),
              ],
            ),
            SizedBox(
                width: 140,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Checkout')))
          ],
        ),
      ),
    );
  }
}
