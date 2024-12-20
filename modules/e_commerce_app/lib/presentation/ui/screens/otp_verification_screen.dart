import 'dart:async';
import 'package:e_commers_app/presentation/controller/email_verification_controller.dart';
import 'package:e_commers_app/presentation/controller/otp_controller.dart';
import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:e_commers_app/presentation/ui/utils/snack_message.dart';
import 'package:e_commers_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:e_commers_app/presentation/ui/widgets/centered_circularpogress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controller/read_profile_controller.dart';
import 'bottom_nav_bar_screen.dart';
import 'complete_profile_screen.dart';

class OTPVarificationScreen extends StatefulWidget {
  final String email;
  const OTPVarificationScreen({super.key, required this.email});

  @override
  State<OTPVarificationScreen> createState() => _OTPVarificationScreenState();
}

class _OTPVarificationScreenState extends State<OTPVarificationScreen> {
  final TextEditingController _otpController= TextEditingController();
  final OTPController otpController = Get.find<OTPController>();
  final ReadProfileController _readProfileController = Get.find<ReadProfileController>();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 100,),
              const Center(child: AppLogoWidget()),
              const SizedBox(height: 24,),
              Text("Enter OTP Code",style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 8,),
              Text("A 6 digit OTP Code has been sent",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.bodyLargeColor,
              ),),
              const SizedBox(height: 8,),
              Form(
                key: _formKey,
        
                child: PinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor:  Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: _otpController,
                  appContext: context,
                  validator: (String? value){
                    if(value?.isEmpty?? true){
                      return "Enter Correct Pin";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24,),
              GetBuilder<OTPController>(
                builder: (otpController) {
                  return Visibility(
                    visible:!otpController.inProgess,
                    replacement:const CenteredCircularpogress(),
                    child: ElevatedButton(
                      onPressed: onTabNextButton,
                      child: const Text("N E X T"),
                    ),
                  );
                }
              ),
              const SizedBox(height: 18,),
              Obx(()=>RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      text: "This code will expire in : ",
                      children:  [
                        TextSpan(
                            text: '${otpController.countdown.value}s',
        
                            style:const TextStyle(
                              color: AppColors.themeColor,
                            )
                        ),
                      ]
                  )
              )),
              const SizedBox(height: 6,),
              Obx(
                    () => TextButton(
                  onPressed: otpController.isResendEnabled.value
                      ? otpController.resendCode
                      : null,
                  child: const Text("Resend Code"),
                ),
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
    //int? otp = int.tryParse(_otpController.text);
    String otp=_otpController.text.trim();

    bool result = await otpController.verifyOtp(widget.email, otp!);

    if(result){
      final bool readProfile=await _readProfileController.getProfileDetails(otpController.accesstoken);
      showSnackBarMsg('Success', 'OTP verified successfully!');
      if(readProfile){
        if(_readProfileController.isProfileCompleted){
          Get.offAll(()=>const BottomNavBarScreen());
        } else {
          Get.to(() => CompleteProfileScreen(token: otpController.accesstoken,));
        }
      }
      else {
        showSnackBarMsg('Failed',_readProfileController.errorMsg ?? 'Navigation failed!',);
      }
    } else {
      showSnackBarMsg('Failed', otpController.errorMsg ?? 'OTP verification failed!',);
    }
  }
}

