import 'package:flutter/material.dart';
import 'package:to_do_application/screens/todoList/to_do_screen.dart';

class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    ));
    return MaterialApp(
      title: "To Do App",
      theme: themeData,
      home: ToDoScreen(),
    );
  }
}
