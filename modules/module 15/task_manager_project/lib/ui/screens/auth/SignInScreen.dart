import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/data/models/network_response.dart';
import 'package:task_manager_project/data/restAPI/network_caller.dart';
import 'package:task_manager_project/data/urls.dart';
import 'package:task_manager_project/style/appColors.dart';
import 'package:task_manager_project/ui/controller/sign_in_controller.dart';
import 'package:task_manager_project/ui/screens/auth/SignUpScreen.dart';
import 'package:task_manager_project/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager_project/ui/widgets/bg_widget.dart';
import 'package:flutter/gestures.dart';

import '../../../data/models/logInModel.dart';
import '../../../utility/appConstant.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/snackBar_msg.dart';
import 'email_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool signInApiInProgress = false;
  bool showPassWord = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Form(
                key: _formkey,
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter Your Email ";
                        }
                        if (AppConstant.emailRegExp.hasMatch(value!) == false) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passWordController,
                      obscureText: showPassWord == false,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            showPassWord = !showPassWord;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          icon: Icon(showPassWord
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter Your Password ";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GetBuilder<SignInController>(
                      builder: (signInController) {
                        return Visibility(
                          visible: signInApiInProgress==false,
                          replacement: const Center(child: CircularProgressIndicator()),
                          child: ElevatedButton(
                            onPressed: onTabNextButton,
                            child: const Icon(Icons.arrow_right),
                          ),
                        );
                      }
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
      ),
    );
  }


  Future<void> onTabNextButton() async{

    if (_formkey.currentState!.validate()) {
      final SignInController signInController = Get.find<SignInController>();
      final bool result = await signInController.signIn(
        emailController.text.trim(),
        passWordController.text,
      );
      if (result) {
        Get.offAll(() => const MainBottomNavScreen());
      } else {
        if (mounted) {
          GetSnackBar(title : signInController.errorMessage);
         // showSnackBarMessage(context, signInController.errorMessage);
        }
      }
    }
  }

  void onTabSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  void onTabForgotPasswordButton() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passWordController.dispose();
    super.dispose();
  }
}
