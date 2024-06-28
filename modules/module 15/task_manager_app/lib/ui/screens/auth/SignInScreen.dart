import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../style/appColors.dart';
import '../../widgets/bg_widget.dart';
import 'SignUpScreen.dart';
import 'email_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();



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
                    "Get Started With",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: passWordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_right),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            onTabForgotPasswordButton();
                          },
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          // style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                                letterSpacing: 0.4),
                            text: "Don't have an account?",
                            children: [
                              TextSpan(
                                text: "  Sign-Up",
                                style: const TextStyle(
                                  color: AppColors.themeColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    onTabSignUpButton();
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
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
  void onTabSignUpButton(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const SignUpScreen(),
      ),
    );
  }

  void onTabForgotPasswordButton(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context)=>const EmailVerificationScreen(),),);
  }

  @override
  void dispose() {
    emailController.dispose();
    passWordController.dispose();
    super.dispose();
  }

}
