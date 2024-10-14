import 'package:e_commers_app/presentation/controller/create_profile_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/email_varification_screen.dart';
import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:e_commers_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:e_commers_app/presentation/ui/widgets/centered_circularpogress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/create_profile_model.dart';
import '../../controller/auth_controller.dart';
import 'home_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  final String token;
  const CompleteProfileScreen({super.key, required this.token});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  // Customer information controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _faxController = TextEditingController();

  // Shipping information controllers
  final TextEditingController _shippingNameController = TextEditingController();
  final TextEditingController _shippingAddressController = TextEditingController();
  final TextEditingController _shippingCityController = TextEditingController();
  final TextEditingController _shippingStateController = TextEditingController();
  final TextEditingController _shippingPostcodeController = TextEditingController();
  final TextEditingController _shippingCountryController = TextEditingController();
  final TextEditingController _shippingPhoneController = TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final CreateProfileController createProfileController=Get.find<CreateProfileController>();

  String? test = AuthController.accessToken;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            key: _formKey,
            children: [
              const SizedBox(height: 100,),
              const Center(child: AppLogoWidget()),
              const SizedBox(height: 24,),
              Text("Complete Profile",style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 8,),
              Text("Get started with us with your details",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.bodyLargeColor,
              ),),
              const SizedBox(height: 24,),
              // Customer details fields
              TextField(controller: _firstNameController, decoration: const InputDecoration(hintText: 'First Name')),
              const SizedBox(height: 16),
              TextField(controller: _lastNameController, decoration: const InputDecoration(hintText: 'Last Name')),
              const SizedBox(height: 16),
              TextField(controller: _mobileController, decoration: const InputDecoration(hintText: 'Mobile')),
              const SizedBox(height: 16),
              TextField(controller: _cityController, decoration: const InputDecoration(hintText: 'City')),
              const SizedBox(height: 16),
              TextField(controller: _stateController, decoration: const InputDecoration(hintText: 'State')),
              const SizedBox(height: 16),
              TextField(controller: _postcodeController, decoration: const InputDecoration(hintText: 'Postcode')),
              const SizedBox(height: 16),
              TextField(controller: _countryController, decoration: const InputDecoration(hintText: 'Country')),
              const SizedBox(height: 16),
              TextField(controller: _faxController, decoration: const InputDecoration(hintText: 'Fax')),

              // Shipping details fields
              const SizedBox(height: 24),
              TextField(controller: _shippingNameController, decoration: const InputDecoration(hintText: 'Shipping Name')),
              const SizedBox(height: 16),
              TextField(controller: _shippingAddressController, decoration: const InputDecoration(hintText: 'Shipping Address')),
              const SizedBox(height: 16),
              TextField(controller: _shippingCityController, decoration: const InputDecoration(hintText: 'Shipping City')),
              const SizedBox(height: 16),
              TextField(controller: _shippingStateController, decoration: const InputDecoration(hintText: 'Shipping State')),
              const SizedBox(height: 16),
              TextField(controller: _shippingPostcodeController, decoration: const InputDecoration(hintText: 'Shipping Postcode')),
              const SizedBox(height: 16),
              TextField(controller: _shippingCountryController, decoration: const InputDecoration(hintText: 'Shipping Country')),
              const SizedBox(height: 16),
              TextField(controller: _shippingPhoneController, decoration: const InputDecoration(hintText: 'Shipping Phone')),
              const SizedBox(height: 24,),
              GetBuilder<CreateProfileController>(
                builder: (createProfileController) {
                  return Visibility(
                    visible: !createProfileController.inprogress,
                    replacement: const CenteredCircularpogress(),
                    child: ElevatedButton(
                      onPressed: onTabNextButton,
                        child: const Text("C O M P L E T E"),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*void onTabNextButton(){
    Get.off(()=>const BottomNavBarScreen());
  }*/

  Future<void> onTabNextButton() async {

    bool result = await createProfileController.postCreateProfileDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _mobileController.text.trim(),
        _cityController.text.trim(),
        _shippingAddressController.text.trim(),
        _postcodeController.text.trim(),
        widget.token);

    if (result == true) {
      Get.snackbar('Success', 'Profile Created successfully!');
      Get.off(() => const EmailVarificationScreen());
    } else {
      Get.snackbar(
        'Error',
        'Token is missing or expired. Please login again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }



    /*    String? token = await Get.find<AuthController>().getAccessToken();

    if (token == null || token.isEmpty) {
      Get.snackbar(
        'Error',
        'Token is missing or expired. Please login again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    // Create an instance of CreateProfileModel with user input data
    CreateProfileModel profileModel = CreateProfileModel(
      cusName: _firstNameController.text.trim(),
      cusAdd: _shippingAddressController.text.trim(),
      cusCity: _cityController.text.trim(),
      cusState: _stateController.text.trim(), // Add the correct data
      cusPostcode: _postcodeController.text.trim(),  // Add the correct data
      cusCountry: _countryController.text.trim(),  // Add the correct data
      cusPhone: _mobileController.text.trim(),
      shipName: _firstNameController.text.trim(),
      shipAdd: _shippingAddressController.text.trim(),
      shipCity: _cityController.text.trim(),
      shipState: _shippingStateController.text.trim(),  // Add the correct data
      shipPostcode: _shippingPostcodeController.text.trim(),  // Add the correct data
      shipCountry: _shippingCountryController.text.trim(),  // Add the correct data
      shipPhone: _mobileController.text.trim(),
    );

    // Call the CreateProfileController to send the data
    bool success = await createProfileController.postCreateProfileDetails(
      profileModel,
      token,  // Replace with actual token
    );
    print("Complete : $token");

    if (success) {
      Get.off(() => const HomeScreen());
    } else {
      Get.snackbar(
        'Error',
        createProfileController.errorMsg ?? 'Failed to create profile',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }*/
  }

  void dispose() {
    // Dispose of all controllers
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postcodeController.dispose();
    _countryController.dispose();
    _faxController.dispose();
    _shippingNameController.dispose();
    _shippingAddressController.dispose();
    _shippingCityController.dispose();
    _shippingStateController.dispose();
    _shippingPostcodeController.dispose();
    _shippingCountryController.dispose();
    _shippingPhoneController.dispose();
    super.dispose();
  }

}
