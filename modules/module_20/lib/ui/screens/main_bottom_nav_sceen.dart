import 'package:flutter/material.dart';
import 'package:module_20/ui/screens/cancelled_task_screen.dart';
import 'package:module_20/ui/screens/in_progress_screen.dart';
import 'package:module_20/ui/screens/new_task_screen.dart';
import 'package:module_20/ui/utility/app_colors.dart';
import 'package:module_20/ui/widgets/profile_app_bar.dart';

import 'comnpleted_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          _selectedIndex = value;
          if (mounted) {
            setState(() {});
          }
        },
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'New Task'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'In Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Cancelled')
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
