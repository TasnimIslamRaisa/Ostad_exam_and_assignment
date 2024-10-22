import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commers_app/presentation/controller/review_profile_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/create_review_screen.dart';
import '../../../data/models/Profile_model.dart';
import '../../../data/models/review_list_data_model.dart';
import '../utils/app_colors.dart';

class ReviewsScreen extends StatefulWidget {
  final int productId;
  const ReviewsScreen({super.key, required this.productId});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final List<Map<String, String>> reviews = [];

  @override
  void initState() {
    super.initState();
    // Fetch initial review data when the screen loads
    _loadReviews();
  }

  // Method to load the reviews
  Future<void> _loadReviews() async {
    await Get.find<ReviewProfileController>().getReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ReviewProfileController>(
              builder: (reviewProfileController) {
                if (reviewProfileController.inProgress) {
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

                if (reviewProfileController.reviewList.isEmpty && reviews.isEmpty) {
                  return const Center(child: Text('No reviews available.'));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: reviewProfileController.reviewList.length + reviews.length,
                  itemBuilder: (context, index) {
                    if (index < reviewProfileController.reviewList.length) {
                      final review = reviewProfileController.reviewList[index];
                      return _buildReviewCard(
                        review.profile?.cusName ?? "Anonymous",
                        review.description ?? "",
                        review.rating != null ? review.rating.toString() : "No rating",
                      );
                    } else {
                      // Render newly added reviews
                      final newReview = reviews[index - reviewProfileController.reviewList.length];
                      return _buildReviewCard(
                        newReview["cusName"]!,
                        newReview["description"]!,
                        newReview["rating"]!,
                      );
                    }
                  },
                );
              },
            ),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newReview = await Get.to(
                () => CreateReviewScreen(productId: widget.productId),
          );

          if (newReview != null) {
            setState(() {
              reviews.add({
                "cusName": newReview["cusName"],
                "description": newReview["description"],
                "rating": newReview["rating"],
              });

              // Optionally, you can also add it to the ReviewProfileController if you want the reviews to be persistent
              Get.find<ReviewProfileController>().reviewList.add(
                ReviewListData(
                  profile: Profile(cusName: newReview["cusName"]),
                  description: newReview["description"],
                  rating: int.parse(newReview["rating"]!),
                ),
              );
            });

            // **Trigger a refresh to reload the entire list, including the new review from backend**
            await _loadReviews();
          }
        },
        heroTag: 'uniqueHeroTag', // Ensure unique tag for each FAB
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildReviewCard(String cusName, String description, String rating) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(cusName),
        subtitle: Text(description),
        trailing: Text('Rating: $rating/5'),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return GetBuilder<ReviewProfileController>(builder: (reviewProfileController) {
      final reviewCount = reviewProfileController.reviewList.length + reviews.length;

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
                  "Review ($reviewCount)", // Display the updated count of reviews
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
                Get.to(() => CreateReviewScreen(
                  productId: widget.productId,
                ));
              },
              heroTag: 'uniqueHeroTag_2', // Provide another unique tag
              child: const Icon(Icons.add),
            ),
          ],
        ),
      );
    });
  }
}
