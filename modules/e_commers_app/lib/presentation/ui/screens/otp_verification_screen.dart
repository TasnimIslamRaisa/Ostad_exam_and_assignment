import 'dart:async';
import 'package:e_commers_app/presentation/controller/otp_controller.dart';
import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:e_commers_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'complete_profile_screen.dart';

class OTPVarificationScreen extends StatefulWidget {
  const OTPVarificationScreen({super.key});

  @override
  State<OTPVarificationScreen> createState() => _OTPVarificationScreenState();
}

class _OTPVarificationScreenState extends State<OTPVarificationScreen> {
  final TextEditingController _otpController= TextEditingController();
  final OTPController otpController = Get.put(OTPController());
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
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
            Text("Enter OTP Code",style: Theme.of(context).textTheme.headlineLarge,),
            const SizedBox(height: 8,),
            Text("A 4 digit OTP Code has been sent",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.bodyLargeColor,
            ),),
            const SizedBox(height: 8,),
            PinCodeTextField(
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
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
              onPressed: onTabNextButton,
              child: const Text("N E X T"),
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
    );
  }

  void onTabNextButton(){
    Get.to(()=>const CompleteProfileScreen());
  }
}
