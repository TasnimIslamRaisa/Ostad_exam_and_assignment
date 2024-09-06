import 'package:e_commers_app/presentation/ui/screens/otp_verification_screen.dart';
import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:e_commers_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  @override
  State<EmailVarificationScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  final TextEditingController _emailController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            const Center(child: AppLogoWidget()),
            const SizedBox(height: 24,),
            Text("Welcome Back",style: Theme.of(context).textTheme.headlineLarge,),
            const SizedBox(height: 8,),
            Text("Please Enter Your Email",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.bodyLargeColor,
            ),),
            const SizedBox(height: 8,),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: onTabNextButton,
                child: const Text("N E X T"),
            ),
          ],
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
    _emailController.dispose();
    super.dispose();

  }
}
