import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/ui/screens/auth/set_password_screen.dart';
import '../../../style/appColors.dart';
import '../../widgets/bg_widget.dart';
import 'SignInScreen.dart';


class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Text(
                    "PIN Verification",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "A 6 digit verification pin has send to your email address",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  pinCodeTextField(errorController: errorController, textEditingController: textEditingController),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed:onTabVerifyButton,
                    child: const Text("Verify",),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                            letterSpacing: 0.4),
                        text: "Have an account?",
                        children: [
                          TextSpan(
                            text: "  Sign-In",
                            style: const TextStyle(
                              color: AppColors.themeColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = onTabSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void onTabVerifyButton(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>const SetPasswordScreen(),),);
  }

  void onTabSignInButton(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=>const SignInScreen(),),
      (route)=>false,
    );
  }



  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

}

class pinCodeTextField extends StatelessWidget {
  const pinCodeTextField({
    super.key,
    required this.errorController,
    required this.textEditingController,
  });

  final StreamController<ErrorAnimationType> errorController;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: AppColors.white,
        inactiveFillColor: AppColors.white,
      ),
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      appContext: context,
    );
  }
}
