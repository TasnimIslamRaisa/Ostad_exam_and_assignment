import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/screens/auth/SignInScreen.dart';
import 'package:task_manager_project/ui/screens/auth/otp_verification_screen.dart';

import '../../../style/appColors.dart';
import '../../widgets/bg_widget.dart';


class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
    final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

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
                    "Set Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Minimum legth of password is 8 character with Letter and number combination",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passController,
                    decoration: const InputDecoration(
                      hintText: "password",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: confirmPassController,
                    decoration: const InputDecoration(
                      hintText: "confirm password",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed:onTabConfirmButton,
                    child: const Text("Confirm"),
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
                              ..onTap = () {
                                onTabSignInButton();
                              },
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
  void onTabSignInButton(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>const SignInScreen(),),);
  }
  void onTabConfirmButton(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>const SignInScreen(),),);
  }

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

}
