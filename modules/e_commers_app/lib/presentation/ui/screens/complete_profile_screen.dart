import 'package:e_commers_app/presentation/ui/screens/otp_verification_screen.dart';
import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:e_commers_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameController= TextEditingController();
  final TextEditingController _lastNameController= TextEditingController();
  final TextEditingController _mobileController= TextEditingController();
  final TextEditingController _cityController= TextEditingController();
  final TextEditingController _shippingAddressController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
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
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                    hintText: 'First Name'
                ),
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                    hintText: 'Last Name'
                ),
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: _mobileController,
                decoration: const InputDecoration(
                    hintText: 'Mobile'
                ),
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                    hintText: 'City'
                ),
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: _shippingAddressController,
                maxLines: 5,
                decoration: const InputDecoration(
                    hintText: 'Shipping Address'
                ),
              ),
              const SizedBox(height: 24,),
              ElevatedButton(
                onPressed: onTabNextButton,
                  child: const Text("C O M P L E T E"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTabNextButton(){
    Get.to(()=>const OTPVarificationScreen());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstNameController.dispose();
    super.dispose();

  }
}
