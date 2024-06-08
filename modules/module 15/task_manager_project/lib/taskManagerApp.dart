import 'package:flutter/material.dart';
import 'package:task_manager_project/style/appColors.dart';
import 'package:task_manager_project/ui/screens/splashScreen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager App",
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(),
      home: const SplashScreen(),
    );
  }

  ThemeData lightThemeData() {
    return ThemeData(
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.white,
        filled: true,
        hintStyle: const TextStyle(
          color: AppColors.subtitleColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.themeColor,
              fixedSize: const Size.fromWidth(double.maxFinite),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))),
    );
  }
}
