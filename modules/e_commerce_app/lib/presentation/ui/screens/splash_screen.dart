import 'package:e_commers_app/presentation/controller/auth_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_logo_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async{
    await Future.delayed(const Duration(seconds: 2));
    await Get.find<AuthController>().getAccessToken();
    //Get.off(()=>const HomeScreen());
    Get.off(()=>const BottomNavBarScreen());
  }
  @override
  void initState() {

    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text("version 1.0.8"),

            ],
          ),
        ),
      ),
    );
  }
}
