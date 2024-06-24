import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_project/ui/screens/auth/SignInScreen.dart';
import 'package:task_manager_project/ui/screens/auth/SignUpScreen.dart';
import 'package:task_manager_project/ui/widgets/bg_widget.dart';
import 'package:task_manager_project/utility/assets_path.dart';

import 'main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgWidget(
        child: Center(
          child: SvgPicture.asset(
            AssetsPath.logoSvgPath,
            width: 200,
          ),
        ),
      ),
    );
  }
}
