import 'package:flutter/material.dart';
import 'package:module_20/ui/controller/auth_controller.dart';
import 'package:module_20/ui/screens/auth/sign_in_screen.dart';
import 'package:module_20/ui/screens/main_bottom_nav_sceen.dart';
import 'package:module_20/ui/utility/assets_path.dart';
import 'package:module_20/ui/widgets/background_wid.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    bool isUserLoggedIn = await AuthController.checkAuthState();
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isUserLoggedIn ? MainBottomNavScreen() : SignInScreen(),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Center(
          child: Image.asset(
            AssetPaths.logo,
          ),
        ),
      ),
    );
  }
}
