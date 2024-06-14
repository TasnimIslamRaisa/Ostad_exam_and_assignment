import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_project/style/appColors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int selected_index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: selected_index,
        onTap: (index){
          selected_index=index;
          if(mounted){
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task),label: "Task",),
          BottomNavigationBarItem(icon: Icon(Icons.gesture_outlined),label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud_done_rounded),label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel),label: "Cancel"),
        ],
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.subtitleColor,
        selectedItemColor: AppColors.themeColor ,
      ) ,
    );
  }
}
