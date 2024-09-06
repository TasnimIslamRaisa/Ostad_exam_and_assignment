import 'package:e_commers_app/presentation/ui/screens/splash_screen.dart';
import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'CraftyBay',
      theme: ThemeData(
        colorSchemeSeed:AppColors.themeColor,
      ),
      home:const SplashScreen(),
    );
  }
}
