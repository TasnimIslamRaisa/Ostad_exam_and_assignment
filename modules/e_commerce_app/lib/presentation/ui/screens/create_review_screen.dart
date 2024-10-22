import 'package:e_commers_app/presentation/ui/utils/snack_message.dart';
import 'package:e_commers_app/presentation/ui/widgets/centered_circularpogress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commers_app/presentation/controller/create_review_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/bottom_nav_bar_screen.dart';

class CreateReviewScreen extends StatefulWidget {
  final int productId; // Pass product ID dynamically
  const CreateReviewScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  _CreateReviewScreenState createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  final CreateReviewController _createReviewController =
      Get.put(CreateReviewController());
  //final CreateReviewController _createReviewController = Get.find<CreateReviewController>().postCreateReview();

  Future<void> _submitReview() async {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String description = _descriptionController.text.trim();
    int? rating =
        int.tryParse(_ratingController.text.trim()); // Convert rating to int

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        description.isEmpty ||
        rating == null ||
        rating < 1 ||
        rating > 5) {
      Get.snackbar("Error",
          "Please fill in all fields correctly. Rating should be between 1 and 5.");
      return;
    }

    bool isSuccess = await _createReviewController.postCreateReview(
      firstName,
      lastName,
      description,
      rating,
      widget.productId, // Use the product ID passed from previous screen
    );

    if (isSuccess) {
      // Create a new review entry to pass back to the ReviewsScreen
      final newReview = {
        "cusName": "$firstName $lastName",
        "description": description,
        "rating": rating.toString()
      };

      // Pass the new review to the ReviewsScreen and pop this screen
      Get.back(result: newReview);
      /*Get.offAll(() =>
          const BottomNavBarScreen()); // Navigate to the bottom nav bar screen on success*/
      showSnackBarMsg("Successful", "Thanks For Your Feedback!");
    } else {
      showSnackBarMsg("Error", _createReviewController.errorMsg ?? "Failed to submit the review.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Write Review',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _ratingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Rating (1-5)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CreateReviewController>(
                      builder: (createReviewController) {
                    return Visibility(
                      visible: !createReviewController.inprogress,
                      replacement: const CenteredCircularpogress(),
                      child: ElevatedButton(
                        onPressed:_submitReview,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: createReviewController.inprogress
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Submit'),
                      ),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
