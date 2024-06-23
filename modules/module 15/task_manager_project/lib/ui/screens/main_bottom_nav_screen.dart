import 'package:flutter/material.dart';
import 'package:task_manager_project/style/appColors.dart';
import 'package:task_manager_project/ui/screens/cancel_task_screen.dart';
import 'package:task_manager_project/ui/screens/completed_task_screen.dart';
import 'package:task_manager_project/ui/screens/in_progress_screen.dart';
import 'package:task_manager_project/ui/screens/new_task_screen.dart';

import '../../utility/profile_app_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int selected_index=0;
  List<Widget> screens=const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressScreen(),
    CancelTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: screens[selected_index],
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
          BottomNavigationBarItem(icon: Icon(Icons.cloud_done_rounded),label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.gesture_outlined),label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel),label: "Cancel"),
        ],
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.subtitleColor,
        selectedItemColor: AppColors.themeColor ,
      ) ,
    );
  }
}
