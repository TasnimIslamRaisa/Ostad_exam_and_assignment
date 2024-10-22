import 'package:e_commers_app/presentation/controller/auth_controller.dart';
import 'package:e_commers_app/presentation/controller/create_wish_list_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/email_varification_screen.dart';
import 'package:e_commers_app/presentation/ui/screens/reviews_screen.dart';
import 'package:e_commers_app/presentation/ui/widgets/centered_circularpogress.dart';
import 'package:e_commers_app/presentation/ui/widgets/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../../../data/models/product_details_model.dart';
import '../../controller/add_to_cart_controller.dart';
import '../../controller/product_details_controller.dart';
import '../utils/app_colors.dart';
import '../utils/snack_message.dart';
import '../widgets/product_image_slider_widget.dart';
import '../widgets/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductDetailsModel productDetailsModel;
  String _selectedColor='';
  String _selectedSize='';
  int quantity=1;


  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inprogress) {
          return const CenteredCircularpogress();
        }

        if (productDetailsController.errorMsg != null) {
          return Center(
            child: Text(productDetailsController.errorMsg!),
          );
        }
        // Ensure productDetailsModel is not null before accessing it
        if (productDetailsController.productDetailsModel == null) {
          return const Center(
            child: Text("Product details not available."),
          );
        }

        productDetailsModel = productDetailsController.productDetailsModel!;

        return Column(
          children: [
            Expanded(
              child: _buildProductDetails(
                  productDetailsController.productDetailsModel!),
            ),
            _buildPriceAndAddToCartSection(
                productDetailsController.productDetailsModel!),

          ],
        );
      }),
    );
  }

  Widget _buildProductDetails(ProductDetailsModel product) {
    List<String> colors=product.color!.split(',');
    _selectedColor=colors.first;
    List<String> size=product.size!.split(',');
    _selectedSize=size.first;
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageSlider(
            sliderUrls: [
              product.img1 ?? '', // Ensure you have fallback for null images
              product.img2 ?? '',
              product.img3 ?? '',
              product.img4 ?? '',
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndQuantitySection(product),
                const SizedBox(height: 4),
                _buildRatingAndReviewSection(product),
                const SizedBox(height: 8),
                /*SizePicker(
                  size: productDetailsModel.color != null ? productDetailsModel.color!.split(',') : [], // Fix here
                  onSizeSelected: (selectedSize) {
                    // Handle size selection
                    print('Selected size: $selectedSize');
                  }, sizes: [],
                ),*/
                /*ColorPicker(
                  colors: const [
                    Colors.cyan,
                    Colors.pink,
                    Colors.greenAccent,
                    Colors.black
                  ],
                  onColorSelected: (color) {
                    _selectedColor=color.toString();
                  },
                ),*/
                SizePicker(
                  size: colors, // Fix here
                  onSizeSelected: (selectedColor) {
                    // Handle size selection
                    _selectedColor=selectedColor;
                    print('Selected size: $selectedColor');
                  },
                  sizes: [],
                ),
                const SizedBox(height: 16),
                SizePicker(
                  size:size, // Fix here
                  onSizeSelected: (selectedSize) {
                    // Handle size selection
                    _selectedColor=selectedSize;
                    print('Selected size: $selectedSize');
                  },
                  sizes: [],
                ),
                const SizedBox(height: 16),
                _buildDescriptionSection(product)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(ProductDetailsModel productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          productDetails.product?.shortDes ?? 'No description available.',
          style: const TextStyle(color: Colors.black45),
        ),
      ],
    );
  }

  Widget _buildNameAndQuantitySection(ProductDetailsModel productDetails) {
    //int quantity = 1;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            productDetails.product?.title ?? 'Unknown',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ItemCount(
          initialValue: quantity,
          //initialValue: 1,
          minValue: 1,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {
            quantity= value.toInt();
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection(ProductDetailsModel productDetails) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(
              '${productDetails.product?.star ?? ''}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            Get.to(()=>ReviewsScreen());
          },
          child: const Text(
            'Reviews',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: AppColors.themeColor),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () async {
          bool added=await Get.find<CreateWishListController>().getCreatedWishtListById(productDetails.productId.toString());
          if(added){
            showSnackBarMsg("Successfuily", "Added To Wish List");
          } else {
            showSnackBarMsg("Failed", "You Have To LogIn");
            Get.offAll(()=> const EmailVarificationScreen());
          }
          },
          child: Card(
            color: AppColors.themeColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.favorite_outline_rounded,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel productDetails) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price'),
              Text(
                '\$${productDetails.product?.price}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
            width: 140,
            child: GetBuilder<AddToCartController>(
              builder: (addToCartController) {
                return Visibility(
                  visible: !addToCartController.inProgess,
                  replacement: const CenteredCircularpogress(),
                  child: ElevatedButton(
                    onPressed: _onTabAddToCard,
                    child: const Text('Add To Cart'),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTabAddToCard() async{
    bool isLoggedInUser=await Get.find<AuthController>().isLoggedIn();
    if(isLoggedInUser){
      final result= await Get.find<AddToCartController>().addToCart(widget.productId, _selectedColor, _selectedSize, quantity);
      if(result){
        showSnackBarMsg('Successfully','Added To Cart');
      }
      else {
        if(mounted){
          showSnackBarMsg('Failed',Get.find<AddToCartController>().errorMsg ?? 'Failed To add Cart');
        }
      }
    } else {
      Get.to(()=>const EmailVarificationScreen());
    }

  }


}
