import 'package:flutter/material.dart';
import 'package:task_manager_project/style/appColors.dart';
import 'package:task_manager_project/ui/screens/splashScreen.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();
  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.navigatorKey,
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
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor),
        labelMedium : TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.subtitleColor),
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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.subtitleColor,
          textStyle:const TextStyle(
            fontWeight: FontWeight.w600,
          )
        ),
      ),
    );
  }
}
