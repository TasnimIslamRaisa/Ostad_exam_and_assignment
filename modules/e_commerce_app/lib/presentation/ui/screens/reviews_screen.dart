import 'package:e_commers_app/presentation/controller/review_profile_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utils/app_colors.dart';


class ReviewsScreen extends StatefulWidget {
  final int productId;
   ReviewsScreen({super.key, required this.productId});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
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
  void initState() {
    super.initState();
    Get.find<ReviewProfileController>().getReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body:Column(
        children: [
          Expanded(
            child: GetBuilder<ReviewProfileController>(
              builder: (reviewProfileController) {
                if(reviewProfileController.inProgress){
                  return const Center(child: CircularProgressIndicator());
                }
                if (reviewProfileController.errorMessage != null) {
                  return Center(
                    child: Text(
                      reviewProfileController.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                if (reviewProfileController.reviewList.isEmpty) {
                  return const Center(child: Text('No reviews available.'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: reviewProfileController.reviewList.length,
                  itemBuilder: (context, index) {
                    final review = reviewProfileController.reviewList[index];
                    final profileName = review.profile?.cusName ?? "Anonymous"; // Handle if profile name is null
                    final reviewDescription = review.description ?? "No review";
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(profileName),
                        subtitle: Text(reviewDescription),
                      ),
                    );
                  },
                );
              }
            ),
          ),
          // Use the ReusableBottomCartWidget at the bottom
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return GetBuilder<ReviewProfileController>(
      builder: (reviewProfileController) {
        final reviewCount = reviewProfileController.reviewList.length;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Reviews'),
                  Text(
                    "Review ($reviewCount)", // Display the actual count of reviews
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.themeColor,
                    ),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: () {
                  Get.to(() => const CreateReviewScreen());
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}