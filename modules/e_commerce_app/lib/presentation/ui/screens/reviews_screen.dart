import 'package:e_commers_app/presentation/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utils/app_colors.dart';


class ReviewsScreen extends StatelessWidget {
   ReviewsScreen({super.key});

  // Sample list of reviews data (you can replace this with your actual data)
  final List<Map<String, String>> reviews = [
    {
      "name": "Rabbil Hasan",
      "review":
      "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator"
    },
    {
      "name": "Rabbil Hasan",
      "review":
      "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator"
    },
    {
      "name": "Rabbil Hasan",
      "review":
      "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator"
    },
    {
      "name": "Rabbil Hasan",
      "review":
      "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(reviews[index]["name"]!),
                    subtitle: Text(reviews[index]["review"]!),
                  ),
                );
              },
            ),
          ),
          // Use the ReusableBottomCartWidget at the bottom
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                //'\$${productDetails.product?.price}',
                "Review (1000)",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              )
            ],
          ),
          FloatingActionButton(
              onPressed: (){
                Get.to(()=>const CreateReviewScreen());
              },
              child: const Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}
