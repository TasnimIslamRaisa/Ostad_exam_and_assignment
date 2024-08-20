import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_20/ui/controller/sign_in_controller.dart';
import 'package:module_20/ui/screens/add_new_task_screen.dart';
import 'package:module_20/ui/screens/auth/email_verification.dart';
import 'package:module_20/ui/screens/auth/sign_up_screen.dart';
import 'package:module_20/ui/screens/main_bottom_nav_sceen.dart';
import 'package:module_20/ui/utility/app_colors.dart';
import 'package:module_20/ui/widgets/background_wid.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  //bool _signInApiProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter Email Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(hintText: 'Password'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your password';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<SignInController>(builder: (signInController) {
                    return Visibility(
                      visible: signInController.signInApiInprogress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _onTapNextButton();
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: _onTapForgetPassword,
                      child: Text(
                        'Forget Password?',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: AppColors.themeColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ));
                              },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (_formState.currentState!.validate()) {
      final SignInController signInController = Get.find<SignInController>();
      final bool result = await signInController.signIn(
        _emailTEController.text.trim(),
        _passwordTEController.text,
      );
      if (result) {
        Get.offAll(() => const MainBottomNavScreen());
      } else {
        if (mounted) {
          showSnackBarMessage(context, signInController.errorMessage);
        }
      }
    }
  }

  void _onTapForgetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
