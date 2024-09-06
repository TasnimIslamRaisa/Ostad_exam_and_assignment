import 'package:e_commers_app/presentation/ui/screens/splash_screen.dart';
import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'CraftyBay',
      theme: ThemeData(
        colorSchemeSeed:AppColors.themeColor,
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.themeColor,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.bodyLargeColor),
            border: _outlineInputBorder(),
            enabledBorder: _outlineInputBorder(),
            focusedBorder: _outlineInputBorder(),
            errorBorder: _outlineInputBorder(Colors.red),
          contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 16)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.themeColor,
                fixedSize: const Size.fromWidth(double.maxFinite),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.themeColor,
            textStyle:const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
      home:const SplashScreen(),
    );
  }
}

OutlineInputBorder _outlineInputBorder([Color? color]){
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? AppColors.themeColor,width: 2),
    borderRadius: BorderRadius.circular(8),
  );
}