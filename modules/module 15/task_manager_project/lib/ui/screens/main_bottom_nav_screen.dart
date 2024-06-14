import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task),),
          BottomNavigationBarItem(icon: Icon(Icons.task),),
          BottomNavigationBarItem(icon: Icon(Icons.task),),
          BottomNavigationBarItem(icon: Icon(Icons.task),),
        ],
      ) ,
    );
  }
}
