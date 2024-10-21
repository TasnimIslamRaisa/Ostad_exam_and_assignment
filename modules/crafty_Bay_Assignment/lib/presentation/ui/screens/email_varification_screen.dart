import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/email_verification_controller.dart';
import '../utils/app_colors.dart';
import '../utils/snack_message.dart';
import '../widgets/app_logo_widget.dart';
import '../widgets/centered_circularpogress.dart';
import 'otp_verification_screen.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  @override
  State<EmailVarificationScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  final TextEditingController _emailController= TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController=Get.find<EmailVerificationController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
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
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
                validator :(String? value){
                  if(value?.isEmpty ?? true){
                    return "Enter Your Email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24,),
              GetBuilder<EmailVerificationController>(
                builder: (emailVerificationController) {
                  return Visibility(
                    visible: !emailVerificationController.inProgess,
                    replacement: const CenteredCircularpogress(),
                    child: ElevatedButton(
                        onPressed: onTabNextButton,
                        child: const Text("N E X T"),
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

  Future<void> onTabNextButton() async{
    if(!_formKey.currentState!.validate()){
      return;
    }
    bool result=await _emailVerificationController.verifyEmail(_emailController.text.trim());

    if(result){
      Get.to(() => OTPVarificationScreen(email: _emailController.text.trim(),));
    } else {
      if(mounted){
        showSnackBarMsg('', _emailVerificationController.errorMsg!, true);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();

  }
}
